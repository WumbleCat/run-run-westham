-- Reference PostGIS schema for the production data model.
--
-- The running MVP reads seed/seed-data.json from memory (see lib/store.ts) so
-- it needs no database, but db/seed.sql targets this schema: apply this file to
-- a PostGIS-enabled Postgres, then run db/seed.sql to load the same 50 people.

CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS users (
  id            uuid PRIMARY KEY,
  handle        text NOT NULL UNIQUE,
  display_name  text NOT NULL,
  avatar_emoji  text NOT NULL DEFAULT '🙂',
  headline      text NOT NULL DEFAULT '',
  is_seed_data  boolean NOT NULL DEFAULT FALSE,
  created_at    timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS attribute_defs (
  id    bigserial PRIMARY KEY,
  kind  text NOT NULL CHECK (kind IN ('company', 'sport', 'interest', 'school', 'language', 'goal')),
  slug  text NOT NULL,
  label text NOT NULL,
  UNIQUE (kind, slug)
);

CREATE TABLE IF NOT EXISTS user_attributes (
  user_id      uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  attribute_id bigint NOT NULL REFERENCES attribute_defs(id) ON DELETE CASCADE,
  weight       real NOT NULL DEFAULT 1,
  visibility   text NOT NULL DEFAULT 'public'
                 CHECK (visibility IN ('public', 'matches', 'private')),
  PRIMARY KEY (user_id, attribute_id)
);

CREATE INDEX IF NOT EXISTS user_attributes_attribute_idx ON user_attributes (attribute_id);

-- One live row per user: presence is current state, not a location history.
CREATE TABLE IF NOT EXISTS user_presence (
  user_id      uuid PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
  geog         geography(Point, 4326) NOT NULL,
  accuracy_m   real NOT NULL,
  discoverable boolean NOT NULL DEFAULT FALSE,
  ghost_until  timestamptz,
  updated_at   timestamptz NOT NULL DEFAULT now()
);

-- GiST on geography is what makes ST_DWithin(..., 100) an index scan.
CREATE INDEX IF NOT EXISTS user_presence_geog_idx ON user_presence USING GIST (geog);
CREATE INDEX IF NOT EXISTS user_presence_updated_idx ON user_presence (updated_at DESC);

CREATE TABLE IF NOT EXISTS blocks (
  blocker_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  blocked_id uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  created_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (blocker_id, blocked_id),
  CHECK (blocker_id <> blocked_id)
);

CREATE TABLE IF NOT EXISTS encounters (
  a_id       uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  b_id       uuid NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  state      text NOT NULL DEFAULT 'seen'
               CHECK (state IN ('seen', 'waved', 'matched', 'declined', 'blocked')),
  waved_by   uuid REFERENCES users(id) ON DELETE SET NULL,
  updated_at timestamptz NOT NULL DEFAULT now(),
  PRIMARY KEY (a_id, b_id),
  CHECK (a_id < b_id)
);
