---
name: gps-proximity-matching-backend
description: Back-end implementation guide for a Pokémon Go-style GPS proximity matching app that surfaces nearby users (<=100 m) who share profile attributes such as company, sports, and interests. Use when building or changing location ingestion, geospatial queries, match scoring, privacy controls, or the public API for this app.
---

# GPS Proximity Matching — Back End

## Scope

Server-side of a real-time "who is near me and worth meeting" app:

1. Ingest device location updates.
2. Answer "who is within R meters of me right now" (default R = 100 m).
3. Score candidates by shared attributes (company, sports, interests, school, languages, goals).
4. Enforce privacy, consent, blocking, and rate limits before anything is returned.
5. Push encounter/match events to clients.

## Data model

Use PostgreSQL + PostGIS as the source of truth and Redis (GEO commands) as the hot cache for live positions. Do not store live positions only in Redis — you need durability for encounter history, and do not store position history in Postgres beyond what you need — it is a liability.

```sql
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE users (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  handle          text UNIQUE NOT NULL,
  display_name    text NOT NULL,
  avatar_url      text,
  created_at      timestamptz NOT NULL DEFAULT now()
);

-- Normalized attributes: one row per (user, attribute). Never free-text match.
CREATE TABLE attribute_defs (
  id        bigserial PRIMARY KEY,
  kind      text NOT NULL,            -- 'company' | 'sport' | 'interest' | 'school' | 'language' | 'goal'
  slug      text NOT NULL,            -- canonicalized: 'acme-corp', 'five-a-side-football'
  label     text NOT NULL,
  rarity    real NOT NULL DEFAULT 0,  -- precomputed IDF-ish weight, refreshed nightly
  UNIQUE (kind, slug)
);

CREATE TABLE user_attributes (
  user_id        uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  attribute_id   bigint NOT NULL REFERENCES attribute_defs(id),
  weight         real NOT NULL DEFAULT 1,   -- user-declared importance 0..1
  visibility     text NOT NULL DEFAULT 'matches', -- 'public' | 'matches' | 'private'
  PRIMARY KEY (user_id, attribute_id)
);
CREATE INDEX ON user_attributes (attribute_id) INCLUDE (user_id);

CREATE TABLE user_presence (
  user_id      uuid PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  geog         geography(Point, 4326) NOT NULL,
  accuracy_m   real NOT NULL,
  discoverable boolean NOT NULL DEFAULT false,  -- opt-in, defaults OFF
  ghost_until  timestamptz,                     -- temporary invisibility
  h3_r9        text NOT NULL,                   -- ~174 m edge cell, for coarse fanout
  updated_at   timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX user_presence_geog_idx ON user_presence USING gist (geog);
CREATE INDEX user_presence_live_idx ON user_presence (h3_r9, updated_at)
  WHERE discoverable;

CREATE TABLE encounters (
  id            bigserial PRIMARY KEY,
  low_user_id   uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  high_user_id  uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  first_seen_at timestamptz NOT NULL DEFAULT now(),
  last_seen_at  timestamptz NOT NULL DEFAULT now(),
  min_distance_m real NOT NULL,
  score         real NOT NULL,
  shared        jsonb NOT NULL,       -- [{kind,slug,label}]
  state         text NOT NULL DEFAULT 'seen', -- 'seen'|'waved'|'matched'|'declined'|'blocked'
  UNIQUE (low_user_id, high_user_id)
);

CREATE TABLE blocks (
  blocker_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  blocked_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  PRIMARY KEY (blocker_id, blocked_id)
);
```

Invariants worth enforcing in code and tests:

- `encounters` rows are canonical-ordered (`low_user_id < high_user_id`) so a pair has exactly one row.
- `user_presence` holds only the *latest* point per user. No trajectory table unless a product requirement forces it; if it does, store it separately with a hard TTL (see Retention).

## Location ingestion

Endpoint: `POST /v1/presence` — called by the client at most every 10 s while foregrounded, every 60–150 s while backgrounded, or on significant-location-change.

```
{ "lat": 51.5387, "lng": 0.0166, "accuracy_m": 12.4,
  "captured_at": "2026-08-29T11:52:03Z", "battery_saver": false }
```

Pipeline, in order:

1. **AuthN/AuthZ** — bearer token; reject if the account is suspended.
2. **Validate** — lat in [-90, 90], lng in [-180, 180], `accuracy_m` in (0, 5000], `captured_at` within ±120 s of server time. Reject `accuracy_m > 150` for matching purposes (store it, but mark presence as unusable rather than producing bogus 100 m answers).
3. **Anti-spoof heuristics** — reject or flag when implied speed between consecutive fixes exceeds ~250 km/h, when the same exact coordinate pair repeats with identical accuracy for many updates, or when the device reports a mock-location provider. Track a per-user `trust_score`; low-trust users can be silently excluded from other users' results.
4. **Rate limit** — token bucket per user (e.g. 12 writes/min) and per IP.
5. **Upsert** presence in Postgres, write `GEOADD presence:live <lng> <lat> <user_id>` in Redis, and `SETEX presence:ttl:<user_id> 300 1`. Redis is truth for "live"; a user absent from the TTL set is treated as offline.
6. **Enqueue** an async `proximity.scan` job for that user (debounced: skip if the user moved < 25 m and a scan ran in the last 30 s).

Never accept a client-supplied `user_id` for presence writes. Never log raw coordinates at full precision — log truncated to ~3 decimals (≈110 m) or an H3 cell id.

## Proximity query

Two-stage: coarse cell fanout, then exact distance. At small scale a single PostGIS query is enough; keep the same shape so you can swap in the Redis path under load.

```sql
-- $1 = viewer id, $2 = point, $3 = radius meters (<=100 default, cap at 500)
WITH me AS (
  SELECT user_id, geog FROM user_presence WHERE user_id = $1
),
nearby AS (
  SELECT p.user_id,
         ST_Distance(p.geog, me.geog) AS distance_m
  FROM user_presence p, me
  WHERE p.user_id <> me.user_id
    AND p.discoverable
    AND (p.ghost_until IS NULL OR p.ghost_until < now())
    AND p.updated_at > now() - interval '5 minutes'
    AND p.accuracy_m <= 150
    AND ST_DWithin(p.geog, me.geog, $3)      -- index-assisted, uses the GiST index
)
SELECT n.user_id, n.distance_m
FROM nearby n
WHERE NOT EXISTS (
  SELECT 1 FROM blocks b
  WHERE (b.blocker_id = $1 AND b.blocked_id = n.user_id)
     OR (b.blocker_id = n.user_id AND b.blocked_id = $1)
)
ORDER BY n.distance_m
LIMIT 200;
```

Notes that matter in practice:

- Use `geography` + `ST_DWithin`, never `ST_Distance(...) < R` on `geometry` in the WHERE clause — the latter cannot use the index and gives degrees, not meters.
- `ST_DWithin` is the only index-accelerated radius predicate; put every other filter after it in cost order.
- Redis alternative for the coarse stage: `GEOSEARCH presence:live FROMLONLAT <lng> <lat> BYRADIUS 100 m ASC COUNT 200`. Redis GEO is a geohash-based approximation — re-verify distance server-side before showing it.
- Inflate the search radius by the *pair's* accuracy: effective radius = `R + min(accuracy_self, 60) + min(accuracy_other, 60)` is too loose; instead query at `R` and label results with a confidence band (`certain` when `distance_m + acc_self + acc_other <= R`, else `nearby`). Do not pretend to 1 m precision on top of a 30 m GPS fix.
- Shard the live set by H3 r6 cell keys (`presence:live:{cell}`) once one Redis key exceeds a few hundred thousand members; fan out to the target cell plus its 6 neighbours.

## Match scoring

Score only *after* the geo filter — it is cheap on ≤200 candidates.

```
overlap(u, v) = Σ over shared attributes a of
                  rarity(a) * kindWeight(a.kind) * sqrt(w_u(a) * w_v(a))

score(u, v) = 100 * tanh(overlap / K)              # squash to 0..100
              * proximityBoost(distance_m)          # 1.0 at 0 m -> 0.6 at 100 m
              * freshness(last_fix_age)             # 1.0 < 60 s -> 0.5 at 5 min
              * mutualIntentGate(u, v)              # 0 if either side's mode excludes the other
```

- `rarity` = `log(1 + total_users / users_with_attribute)`, recomputed nightly into `attribute_defs.rarity`. Without it "likes music" dominates "works at the same 40-person company".
- `kindWeight`: company 1.4, school 1.2, sport 1.1, goal 1.1, interest 1.0, language 0.8 — tune with real engagement data, keep in config, not code.
- Compute shared attributes with a set intersection in the DB (`user_attributes` join on `attribute_id`) for the candidate batch in one query; do not N+1.
- Respect `visibility`: an attribute with `visibility='private'` contributes to the score but is **not** named in the response; `'matches'` is named only after both sides wave.
- Suppress candidates below a score floor (e.g. 15) so the map does not fill with strangers who share nothing — proximity alone is not a match.
- Cache the pair score for 10 minutes keyed by `(low_id, high_id, attr_version)`; attributes change far less often than positions.

## Encounter lifecycle

`seen` → `waved` (one side) → `matched` (both) → chat unlocked. `declined` and `blocked` are terminal for the pair.

- Only persist an encounter once the pair has been within R for ≥ 30 s of continuous or near-continuous observation (2 consecutive scans). This kills the "walked past on a train" flood.
- Notify at most once per pair per 24 h, and cap proactive pushes at ~5/day per user.
- Never reveal that user B declined; B simply stops appearing for A.
- On `matched`, expose exact-ish distance and a coarse direction, plus the shared attributes both sides made visible. Before `matched`, expose only a bucketed distance (`"<25 m"`, `"25–50 m"`, `"50–100 m"`) and coarse profile fields.

## Privacy, safety, compliance

Non-negotiables — treat these as acceptance criteria, not nice-to-haves:

- **Discoverability is opt-in and off by default** (`discoverable = false`). Turning it on requires an explicit in-app action, and the app must work (viewing profile, chats) with it off.
- **Kill switch**: `POST /v1/presence/ghost {minutes}` and `DELETE /v1/presence` (immediate purge of live position). Both must take effect within one scan cycle.
- **Never return raw coordinates of another user.** Return bucketed distance and, at most, a jittered bearing. Fine-grained coordinates plus a mobile client equals trilateration: an attacker samples distance from three positions and recovers a home address. Snap any displayed position to a ≥100 m grid and keep the *same* jitter offset per (viewer, target, hour) so repeated sampling cannot average it away.
- **No distance-to-non-discoverable-users**, ever, including in aggregate counts small enough to deanonymize (suppress cell counts < 5).
- **Retention**: live presence has a 5-minute usefulness TTL and is deleted on logout; keep at most 24 h of coarse (H3 r7) history for abuse investigation, then hard-delete. Encounters keep no coordinates, only `min_distance_m`.
- **Blocking is bidirectional and applied at query time** (see the `NOT EXISTS` clause), not in the client.
- **Minors**: if the platform allows under-18 accounts, exclude them from adult proximity discovery entirely rather than filtering client-side.
- **Report flow**: `POST /v1/reports` with `{target_id, reason, encounter_id}`; auto-hide the reported user from the reporter immediately, queue for moderation, and rate-limit to prevent report-bombing.
- **Legal**: GDPR/CCPA — location is sensitive personal data. Record consent (version, timestamp, IP) in an audit table, support export and deletion (`DELETE /v1/me` cascades through presence, encounters, attributes), and document the retention windows in the privacy policy. Do not sell or share location with third-party SDKs; keep analytics events coordinate-free.

## API surface

```
POST   /v1/presence                 -> {ok, next_ping_seconds}
POST   /v1/presence/ghost           -> {ghost_until}
DELETE /v1/presence                 -> 204 (purge live location)
GET    /v1/nearby?radius=100        -> {generated_at, users:[{
                                          id, display_name, avatar_url,
                                          distance_bucket, bearing_deg_coarse,
                                          score, shared:[{kind,label}],
                                          confidence: "certain"|"nearby",
                                          encounter_state }]}
POST   /v1/encounters/{id}/wave     -> {state}
POST   /v1/encounters/{id}/decline  -> 204
POST   /v1/blocks                   -> 201
POST   /v1/reports                  -> 202
GET    /v1/me/attributes            -> list
PUT    /v1/me/attributes            -> replace set (validates against attribute_defs)
WS     /v1/stream                   -> events: nearby.updated, encounter.new, match.created, chat.message
```

Conventions: idempotency key on all mutating calls; ETag/`If-None-Match` on `/v1/nearby` (returns 304 when the nearby set is unchanged — common when standing still); cursor pagination nowhere (the result is capped at 200 by design); every response carries `generated_at` so the client can show staleness.

## Realtime delivery

- WebSocket per active client, authenticated on connect, subscribed to a topic per H3 r9 cell; the server re-subscribes the socket as the user crosses cells.
- Server pushes `nearby.updated` at most every 5 s per client, coalescing changes. Clients must still tolerate polling-only mode (backgrounded, restricted network).
- Use a Redis pub/sub or NATS fanout keyed by cell so any app instance can serve any socket; do not pin users to instances.

## Performance targets and testing

- `/v1/nearby` p95 < 120 ms server time at 10 k concurrent discoverable users per city.
- Presence write p95 < 40 ms; it must not do scoring work inline.
- Test with fixed fixtures at known coordinates: assert 99 m in, 101 m out, antimeridian crossing (lng 179.999 vs -179.999), equator/pole behaviour, and that a non-discoverable user never appears. Add a property test asserting no endpoint ever emits another user's lat/lng.
- Load-test the scan job separately from the API; a stampede of scans is the usual first failure mode.
