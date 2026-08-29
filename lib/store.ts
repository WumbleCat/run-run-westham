/**
 * In-memory store backed by the generated seed fixture.
 *
 * The production data model is PostGIS (see db/schema.sql); this MVP keeps the
 * same shape in memory so the app runs with no database and deploys to a
 * serverless platform unchanged. Because serverless instances are ephemeral,
 * encounter state is best-effort per instance - see README "Data model".
 */
import seedData from '@/seed/seed-data.json';
import type {
  Attribute,
  EncounterState,
  NearbyResponse,
  NearbyUser,
  SeedFile,
  SeedPerson,
} from '@/lib/types';
import {
  bearingDegrees,
  confidence,
  distanceBucket,
  distanceMeters,
  jitterBearing,
} from '@/lib/geo';
import { SCORE_FLOOR, scorePair, type CandidateAttribute } from '@/lib/matching';

const seed = seedData as SeedFile;

export const SEED_NOTICE = seed.seedDataNotice;
export const ANCHOR = seed.anchor;
export const DEFAULT_RADIUS_M = seed.radiusM;

/** Fixes older than this are treated as offline rather than stale-but-live. */
export const MAX_FIX_AGE_SECONDS = 300;
/** Fixes wider than this cannot support a 100 m claim at all. */
export const MAX_ACCURACY_M = 150;
/** Hard cap on candidates returned, matching the documented API contract. */
export const MAX_RESULTS = 200;

const peopleById = new Map<string, SeedPerson>(seed.people.map((p) => [p.id, p]));

/** log(1 + N / n_with_attribute): keeps "same 40-person company" above "likes music". */
const rarityByKey = ((): Map<string, number> => {
  const counts = new Map<string, number>();
  for (const person of seed.people) {
    for (const attr of person.attributes) {
      const key = `${attr.kind}:${attr.slug}`;
      counts.set(key, (counts.get(key) ?? 0) + 1);
    }
  }
  const total = seed.people.length;
  const rarity = new Map<string, number>();
  for (const [key, count] of counts) {
    rarity.set(key, Math.log(1 + total / count));
  }
  return rarity;
})();

function toCandidateAttributes(attributes: Attribute[]): CandidateAttribute[] {
  return attributes.map((attr) => ({
    kind: attr.kind,
    slug: attr.slug,
    label: attr.label,
    weight: attr.weight ?? 1,
    visibility: attr.visibility ?? 'public',
    rarity: rarityByKey.get(`${attr.kind}:${attr.slug}`) ?? 1,
  }));
}

const blockedPairs = new Set<string>(
  seed.blocks.flatMap((b) => [`${b.blockerId}|${b.blockedId}`, `${b.blockedId}|${b.blockerId}`]),
);

/** Best-effort, per-instance encounter state. A real deployment persists this. */
const encounterStates = new Map<string, EncounterState>();

const pairKey = (a: string, b: string): string => (a < b ? `${a}|${b}` : `${b}|${a}`);

export function getEncounterState(viewerId: string, targetId: string): EncounterState {
  return encounterStates.get(pairKey(viewerId, targetId)) ?? 'seen';
}

export function setEncounterState(
  viewerId: string,
  targetId: string,
  state: EncounterState,
): EncounterState {
  encounterStates.set(pairKey(viewerId, targetId), state);
  return state;
}

export function resetEncounterStates(): void {
  encounterStates.clear();
}

export function getViewer(): SeedPerson {
  const viewer = peopleById.get(seed.viewerId);
  if (!viewer) throw new Error('seed fixture has no viewer');
  return viewer;
}

export function getPerson(id: string): SeedPerson | undefined {
  return peopleById.get(id);
}

export function listPeople(): SeedPerson[] {
  return seed.people;
}

export interface NearbyOptions {
  /** Live device position; falls back to the seed viewer's fixture position. */
  lat?: number;
  lng?: number;
  accuracyM?: number;
  radiusM?: number;
  /** Include sub-floor scores - used by the demo "show everyone" toggle. */
  includeWeakMatches?: boolean;
}

export function findNearby(options: NearbyOptions = {}): NearbyResponse {
  const viewer = getViewer();
  const radiusM = clampRadius(options.radiusM ?? DEFAULT_RADIUS_M);
  const origin = {
    lat: options.lat ?? viewer.presence.lat,
    lng: options.lng ?? viewer.presence.lng,
  };
  const viewerAccuracyM = options.accuracyM ?? viewer.presence.accuracyM;
  const viewerAttributes = toCandidateAttributes(viewer.attributes);

  const users: NearbyUser[] = [];

  for (const person of seed.people) {
    if (person.id === viewer.id) continue;
    if (blockedPairs.has(`${viewer.id}|${person.id}`)) continue;

    const { presence } = person;
    if (!presence.discoverable || presence.ghosted) continue;
    if (presence.accuracyM > MAX_ACCURACY_M) continue;
    if (presence.fixAgeSeconds > MAX_FIX_AGE_SECONDS) continue;

    const distanceM = distanceMeters(origin, { lat: presence.lat, lng: presence.lng });
    if (distanceM > radiusM) continue;

    const state = getEncounterState(viewer.id, person.id);
    if (state === 'declined' || state === 'blocked') continue;

    const { score, shared, hiddenSharedCount } = scorePair(
      viewerAttributes,
      toCandidateAttributes(person.attributes),
      {
        distanceM,
        fixAgeSeconds: presence.fixAgeSeconds,
        radiusM,
        matched: state === 'matched',
      },
    );
    if (score < SCORE_FLOOR && !options.includeWeakMatches) continue;

    users.push({
      id: person.id,
      handle: person.handle,
      displayName: person.displayName,
      avatarEmoji: person.avatarEmoji,
      headline: person.headline,
      distanceM: discloseDistance(distanceM, state === 'matched'),
      distanceBucket: distanceBucket(distanceM, radiusM),
      bearingDeg:
        Math.round(
          jitterBearing(bearingDegrees(origin, { lat: presence.lat, lng: presence.lng }), viewer.id, person.id) * 10,
        ) / 10,
      score,
      confidence: confidence(distanceM, viewerAccuracyM, presence.accuracyM, radiusM),
      shared,
      hiddenSharedCount,
      encounterState: state,
      fixAgeSeconds: presence.fixAgeSeconds,
    });
  }

  users.sort((a, b) => b.score - a.score || a.distanceM - b.distanceM);

  return {
    generatedAt: new Date().toISOString(),
    radiusM,
    viewer: {
      id: viewer.id,
      displayName: viewer.displayName,
      discoverable: viewer.presence.discoverable,
      accuracyM: viewerAccuracyM,
    },
    users: users.slice(0, MAX_RESULTS),
  };
}

/**
 * Exact metres are only for matched pairs. Everyone else gets a 5 m-quantised
 * value, enough to place a marker in the right band but not to trilaterate.
 */
function discloseDistance(distanceM: number, matched: boolean): number {
  return matched ? Math.round(distanceM * 10) / 10 : Math.round(distanceM / 5) * 5;
}

export function clampRadius(radiusM: number): number {
  if (!Number.isFinite(radiusM)) return DEFAULT_RADIUS_M;
  return Math.min(500, Math.max(10, radiusM));
}
