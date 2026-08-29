import { afterEach, describe, expect, it } from 'vitest';

import { distanceMeters } from '@/lib/geo';
import {
  DEFAULT_RADIUS_M,
  MAX_ACCURACY_M,
  MAX_FIX_AGE_SECONDS,
  clampRadius,
  findNearby,
  getViewer,
  listPeople,
  resetEncounterStates,
  setEncounterState,
} from '@/lib/store';

const byHandle = (handle: string) => {
  const person = listPeople().find((p) => p.handle === handle);
  if (!person) throw new Error(`seed fixture is missing ${handle}`);
  return person;
};

const handles = (): string[] => findNearby().users.map((u) => u.handle);

afterEach(() => resetEncounterStates());

describe('findNearby radius threshold', () => {
  it.each([
    ['jonas_wren', true],
    ['kaia_solent', true],
    ['liam_ostrich', true],
    ['mira_halcyon', false],
    ['nils_barrow', false],
  ])('%s in range: %s', (handle, expected) => {
    expect(handles().includes(handle)).toBe(expected);
  });

  it('includes the person sitting exactly on the 100 m boundary', () => {
    const viewer = getViewer();
    const liam = byHandle('liam_ostrich');
    expect(distanceMeters(viewer.presence, liam.presence)).toBeLessThanOrEqual(DEFAULT_RADIUS_M);
    expect(handles()).toContain('liam_ostrich');
  });

  it('matches the fixture expectations for every row', () => {
    // expectedInRange is about eligibility, not ranking, so include weak matches.
    const inRange = new Set(findNearby({ includeWeakMatches: true }).users.map((u) => u.handle));
    for (const person of listPeople()) {
      if (person.handle === getViewer().handle) continue;
      expect(
        { handle: person.handle, inRange: inRange.has(person.handle) },
        `case: ${person.demo.caseLabel}`,
      ).toEqual({ handle: person.handle, inRange: person.demo.expectedInRange });
    }
  });

  it('brings out-of-range people in when the radius widens', () => {
    const wide = findNearby({ radiusM: 300 }).users.map((u) => u.handle);
    expect(wide).toContain('nils_barrow');
  });
});

describe('findNearby exclusions', () => {
  it('never returns the viewer', () => {
    expect(handles()).not.toContain(getViewer().handle);
  });

  it('drops people who turned discoverability off or went ghost', () => {
    const results = handles();
    for (const person of listPeople()) {
      if (!person.presence.discoverable || person.presence.ghosted) {
        expect(results).not.toContain(person.handle);
      }
    }
  });

  it('drops unusable accuracy and stale fixes', () => {
    const results = new Set(handles());
    for (const person of listPeople()) {
      if (
        person.presence.accuracyM > MAX_ACCURACY_M ||
        person.presence.fixAgeSeconds > MAX_FIX_AGE_SECONDS
      ) {
        expect(results.has(person.handle)).toBe(false);
      }
    }
  });

  it('honours blocks in both directions', () => {
    const results = handles();
    expect(results).not.toContain('xan_petrel');
    expect(results).not.toContain('basil_quorn');
  });

  it('hides people the viewer declined or blocked in-session', () => {
    const target = findNearby().users[0];
    setEncounterState(getViewer().id, target.id, 'declined');
    expect(handles()).not.toContain(target.handle);
  });
});

describe('findNearby payload', () => {
  it('never exposes coordinates or accuracy of other people', () => {
    const serialised = JSON.stringify(findNearby().users);
    expect(serialised).not.toMatch(/"lat"|"lng"|"accuracyM"/);
  });

  it('quantises distance to 5 m until the pair matches', () => {
    const before = findNearby().users[0];
    expect(before.distanceM % 5).toBe(0);

    setEncounterState(getViewer().id, before.id, 'matched');
    const after = findNearby().users.find((u) => u.id === before.id);
    expect(after?.encounterState).toBe('matched');
  });

  it('sorts by score then distance and reports buckets consistently', () => {
    const users = findNearby().users;
    expect(users.length).toBeGreaterThan(5);
    for (let i = 1; i < users.length; i += 1) {
      const prev = users[i - 1];
      const current = users[i];
      expect(
        prev.score > current.score ||
          (prev.score === current.score && prev.distanceM <= current.distanceM),
      ).toBe(true);
    }
    for (const user of users) {
      expect(user.distanceBucket).not.toBe('out of range');
      expect(user.score).toBeGreaterThanOrEqual(15);
    }
  });

  it('keeps sub-floor candidates out unless weak matches are requested', () => {
    const normal = findNearby().users.length;
    const weak = findNearby({ includeWeakMatches: true }).users.length;
    expect(weak).toBeGreaterThanOrEqual(normal);
    expect(findNearby({ includeWeakMatches: true }).users.some((u) => u.score < 15)).toBe(true);
  });

  it('accepts a live viewer position', () => {
    const target = byHandle('nils_barrow');
    const results = findNearby({
      lat: target.presence.lat,
      lng: target.presence.lng,
      accuracyM: 8,
    });
    expect(results.users.map((u) => u.handle)).toContain('nils_barrow');
  });
});

describe('clampRadius', () => {
  it('bounds the radius and falls back on nonsense input', () => {
    expect(clampRadius(1)).toBe(10);
    expect(clampRadius(100)).toBe(100);
    expect(clampRadius(10_000)).toBe(500);
    expect(clampRadius(Number.NaN)).toBe(DEFAULT_RADIUS_M);
  });
});
