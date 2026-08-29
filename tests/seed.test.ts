import { execFileSync } from 'node:child_process';
import { readFileSync } from 'node:fs';
import { describe, expect, it } from 'vitest';

import seedData from '@/seed/seed-data.json';
import type { SeedFile } from '@/lib/types';

const seed = seedData as SeedFile;
const JSON_PATH = 'seed/seed-data.json';
const SQL_PATH = 'db/seed.sql';

describe('seed fixture', () => {
  it('has exactly 50 fictional people and ~100 core rows', () => {
    expect(seed.people).toHaveLength(50);
    expect(seed.people.length * 2).toBe(100);
  });

  it('is labelled as demo data', () => {
    expect(seed.seedDataNotice).toMatch(/SEED\/DEMO DATA/);
    expect(readFileSync(SQL_PATH, 'utf8')).toMatch(/SEED\/DEMO DATA/);
  });

  it('has unique ids and handles', () => {
    expect(new Set(seed.people.map((p) => p.id)).size).toBe(50);
    expect(new Set(seed.people.map((p) => p.handle)).size).toBe(50);
  });

  it('gives everyone attributes and a valid position', () => {
    for (const person of seed.people) {
      expect(person.attributes.length, person.handle).toBeGreaterThan(0);
      expect(Math.abs(person.presence.lat)).toBeLessThanOrEqual(90);
      expect(Math.abs(person.presence.lng)).toBeLessThanOrEqual(180);
      expect(person.presence.accuracyM).toBeGreaterThan(0);
    }
  });

  it('covers the threshold and privacy edge cases', () => {
    const distances = seed.people.map((p) => p.demo.designedDistanceM);
    for (const metres of [25, 50, 99, 99.9, 100, 100.6, 101]) {
      expect(distances, `missing a ${metres} m case`).toContain(metres);
    }
    expect(seed.people.some((p) => !p.presence.discoverable)).toBe(true);
    expect(seed.people.some((p) => p.presence.ghosted)).toBe(true);
    expect(seed.people.some((p) => p.presence.accuracyM > 150)).toBe(true);
    expect(seed.people.some((p) => p.presence.fixAgeSeconds > 300)).toBe(true);
    expect(seed.people.some((p) => p.attributes.some((a) => a.visibility !== 'public'))).toBe(true);
    expect(seed.blocks).toHaveLength(2);
  });

  it('is idempotent: re-running the generator reproduces both artefacts byte for byte', () => {
    const jsonBefore = readFileSync(JSON_PATH, 'utf8');
    const sqlBefore = readFileSync(SQL_PATH, 'utf8');

    execFileSync('npx', ['tsx', 'scripts/seed.ts'], { stdio: 'pipe' });

    expect(readFileSync(JSON_PATH, 'utf8')).toBe(jsonBefore);
    expect(readFileSync(SQL_PATH, 'utf8')).toBe(sqlBefore);
  }, 60_000);
});
