import type { AttributeKind, SharedAttribute, Visibility } from '@/lib/types';

export interface CandidateAttribute {
  kind: AttributeKind;
  slug: string;
  label: string;
  weight: number;
  visibility: Visibility;
  /** log(1 + total_users / users_with_attribute), precomputed per attribute. */
  rarity: number;
}

/** Relative pull of each attribute kind. Tune from engagement data, keep in config. */
export const KIND_WEIGHT: Record<AttributeKind, number> = {
  company: 1.4,
  school: 1.2,
  sport: 1.1,
  goal: 1.1,
  interest: 1.0,
  language: 0.8,
};

/** Squash constant for the tanh curve: overlap of ~K lands near score 76. */
const SQUASH_K = 4;

/** Below this, proximity alone is not a match and the candidate is suppressed. */
export const SCORE_FLOOR = 15;

export interface ScoreResult {
  score: number;
  shared: SharedAttribute[];
  hiddenSharedCount: number;
  overlap: number;
}

export function proximityBoost(distanceM: number, radiusM = 100): number {
  const t = Math.min(1, Math.max(0, distanceM / radiusM));
  return 1 - 0.4 * t; // 1.0 at 0m -> 0.6 at the radius
}

export function freshness(fixAgeSeconds: number): number {
  if (fixAgeSeconds <= 60) return 1;
  if (fixAgeSeconds >= 300) return 0.5;
  return 1 - (0.5 * (fixAgeSeconds - 60)) / 240;
}

/**
 * Rarity-weighted attribute overlap, squashed to 0..100 and modulated by
 * distance and fix freshness. Shared attributes marked `private` count toward
 * the score but are never named back to the viewer.
 */
export function scorePair(
  viewer: CandidateAttribute[],
  target: CandidateAttribute[],
  opts: { distanceM: number; fixAgeSeconds: number; radiusM?: number; matched?: boolean },
): ScoreResult {
  const radiusM = opts.radiusM ?? 100;
  const viewerByKey = new Map(viewer.map((a) => [`${a.kind}:${a.slug}`, a]));

  let overlap = 0;
  const shared: SharedAttribute[] = [];
  let hiddenSharedCount = 0;

  for (const t of target) {
    const mine = viewerByKey.get(`${t.kind}:${t.slug}`);
    if (!mine) continue;
    overlap += t.rarity * KIND_WEIGHT[t.kind] * Math.sqrt(mine.weight * t.weight);

    const nameable =
      t.visibility === 'public' || (t.visibility === 'matches' && opts.matched === true);
    if (nameable) shared.push({ kind: t.kind, label: t.label });
    else hiddenSharedCount += 1;
  }

  const score =
    100 *
    Math.tanh(overlap / SQUASH_K) *
    proximityBoost(opts.distanceM, radiusM) *
    freshness(opts.fixAgeSeconds);

  shared.sort((a, b) => KIND_WEIGHT[b.kind] - KIND_WEIGHT[a.kind]);

  return {
    score: Math.round(score),
    shared,
    hiddenSharedCount,
    overlap: Math.round(overlap * 1000) / 1000,
  };
}
