import { describe, expect, it } from 'vitest';

import { freshness, proximityBoost, scorePair, type CandidateAttribute } from '@/lib/matching';

const attr = (
  kind: CandidateAttribute['kind'],
  slug: string,
  overrides: Partial<CandidateAttribute> = {},
): CandidateAttribute => ({
  kind,
  slug,
  label: slug,
  weight: 1,
  visibility: 'public',
  rarity: 1,
  ...overrides,
});

const opts = { distanceM: 0, fixAgeSeconds: 0 };

describe('proximityBoost', () => {
  it('decays from 1.0 at the centre to 0.6 at the radius', () => {
    expect(proximityBoost(0, 100)).toBeCloseTo(1);
    expect(proximityBoost(50, 100)).toBeCloseTo(0.8);
    expect(proximityBoost(100, 100)).toBeCloseTo(0.6);
    expect(proximityBoost(400, 100)).toBeCloseTo(0.6);
  });
});

describe('freshness', () => {
  it('is flat for a minute then decays to 0.5 at five minutes', () => {
    expect(freshness(0)).toBe(1);
    expect(freshness(60)).toBe(1);
    expect(freshness(180)).toBeCloseTo(0.75);
    expect(freshness(300)).toBe(0.5);
    expect(freshness(900)).toBe(0.5);
  });
});

describe('scorePair', () => {
  it('scores zero with no overlap', () => {
    const result = scorePair([attr('sport', 'padel')], [attr('interest', 'baking')], opts);
    expect(result.overlap).toBe(0);
    expect(result.score).toBe(0);
    expect(result.shared).toEqual([]);
  });

  it('weights a shared employer above a shared language', () => {
    const company = scorePair(
      [attr('company', 'nimbus-freight')],
      [attr('company', 'nimbus-freight')],
      opts,
    );
    const language = scorePair([attr('language', 'welsh')], [attr('language', 'welsh')], opts);
    expect(company.score).toBeGreaterThan(language.score);
  });

  it('rewards rarer attributes more than common ones', () => {
    const rare = scorePair(
      [attr('interest', 'x', { rarity: 3 })],
      [attr('interest', 'x', { rarity: 3 })],
      opts,
    );
    const common = scorePair(
      [attr('interest', 'x', { rarity: 0.2 })],
      [attr('interest', 'x', { rarity: 0.2 })],
      opts,
    );
    expect(rare.score).toBeGreaterThan(common.score);
  });

  it('grows with overlap but stays within 0..100', () => {
    const many = Array.from({ length: 12 }, (_, i) => attr('interest', `i${i}`, { rarity: 3 }));
    const result = scorePair(many, many, opts);
    expect(result.score).toBeGreaterThan(80);
    expect(result.score).toBeLessThanOrEqual(100);
  });

  it('counts private overlap without naming it', () => {
    const viewer = [attr('company', 'nimbus-freight')];
    const target = [attr('company', 'nimbus-freight', { visibility: 'private' })];
    const result = scorePair(viewer, target, opts);
    expect(result.overlap).toBeGreaterThan(0);
    expect(result.shared).toEqual([]);
    expect(result.hiddenSharedCount).toBe(1);
  });

  it('reveals matches-only overlap once the pair has matched', () => {
    const viewer = [attr('school', 'thameside-poly')];
    const target = [attr('school', 'thameside-poly', { visibility: 'matches' })];
    expect(scorePair(viewer, target, opts).shared).toEqual([]);
    expect(scorePair(viewer, target, { ...opts, matched: true }).shared).toEqual([
      { kind: 'school', label: 'thameside-poly' },
    ]);
  });

  it('penalises distance and staleness', () => {
    const shared = [attr('company', 'nimbus-freight', { rarity: 2 })];
    const close = scorePair(shared, shared, { distanceM: 5, fixAgeSeconds: 10 });
    const far = scorePair(shared, shared, { distanceM: 98, fixAgeSeconds: 10 });
    const stale = scorePair(shared, shared, { distanceM: 5, fixAgeSeconds: 290 });
    expect(close.score).toBeGreaterThan(far.score);
    expect(close.score).toBeGreaterThan(stale.score);
  });
});
