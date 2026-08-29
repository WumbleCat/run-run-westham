/**
 * Seed/demo data builder.
 *
 *   npm run seed          regenerate seed/seed-data.json and db/seed.sql
 *   npm run seed:reset    delete the generated artefacts, then regenerate
 *   npm run seed:verify   check the fixture invariants without writing
 *
 * The output is a pure function of seed/people.ts, so re-running is idempotent:
 * the same bytes are produced every time and the app can be reset by rerunning.
 */
import { createHash } from 'node:crypto';
import { mkdirSync, rmSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

import { destinationPoint, distanceMeters } from '../lib/geo';
import type { SeedFile, SeedPerson } from '../lib/types';
import {
  ANCHOR,
  BLOCKS,
  FIXED_COORDINATES,
  PEOPLE,
  RADIUS_M,
  SEED_NOTICE,
  VIEWER_HANDLE,
} from '../seed/people';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const JSON_PATH = join(ROOT, 'seed', 'seed-data.json');
const SQL_PATH = join(ROOT, 'db', 'seed.sql');

/** Stable, obviously-synthetic id derived from the handle. */
function seedId(handle: string): string {
  const h = createHash('sha256').update(`run-run-westham:seed:${handle}`).digest('hex');
  return [h.slice(0, 8), h.slice(8, 12), h.slice(12, 16), h.slice(16, 20), h.slice(20, 32)].join(
    '-',
  );
}

function buildPeople(): SeedPerson[] {
  const viewerSpec = PEOPLE.find((p) => p.handle === VIEWER_HANDLE);
  if (!viewerSpec) throw new Error(`seed/people.ts is missing the viewer "${VIEWER_HANDLE}"`);

  const coordsFor = (handle: string, distanceM: number, bearingDeg: number) =>
    FIXED_COORDINATES[handle] ?? destinationPoint(ANCHOR, distanceM, bearingDeg);

  const viewerCoords = coordsFor(viewerSpec.handle, viewerSpec.distanceM, viewerSpec.bearingDeg);

  return PEOPLE.map((spec) => {
    const { lat, lng } = coordsFor(spec.handle, spec.distanceM, spec.bearingDeg);
    // Recompute from the emitted coordinates so the fixture cannot drift from
    // what the matcher will actually measure.
    const actual = Math.round(distanceMeters(viewerCoords, { lat, lng }) * 100) / 100;
    const usableFix = spec.accuracyM <= 150;
    const fresh = spec.fixAgeSeconds <= 300;
    const visible = spec.discoverable && !spec.ghosted;
    const blocked = BLOCKS.some(
      (b) =>
        (b.blocker === spec.handle && b.blocked === VIEWER_HANDLE) ||
        (b.blocker === VIEWER_HANDLE && b.blocked === spec.handle),
    );

    return {
      id: seedId(spec.handle),
      handle: spec.handle,
      displayName: spec.displayName,
      avatarEmoji: spec.avatarEmoji,
      headline: spec.headline,
      attributes: spec.attributes,
      presence: {
        lat,
        lng,
        accuracyM: spec.accuracyM,
        discoverable: spec.discoverable,
        ghosted: spec.ghosted,
        fixAgeSeconds: spec.fixAgeSeconds,
      },
      demo: {
        designedDistanceM: actual,
        caseLabel: spec.caseLabel,
        expectedInRange:
          spec.handle !== VIEWER_HANDLE &&
          visible &&
          usableFix &&
          fresh &&
          !blocked &&
          actual <= RADIUS_M,
      },
    } satisfies SeedPerson;
  });
}

function buildSeedFile(): SeedFile {
  const people = buildPeople();
  const byHandle = new Map(people.map((p) => [p.handle, p]));
  const viewer = byHandle.get(VIEWER_HANDLE);
  if (!viewer) throw new Error('viewer missing after build');

  return {
    seedDataNotice: SEED_NOTICE,
    generatedBy: 'npm run seed (scripts/seed.ts) - deterministic, safe to re-run',
    viewerId: viewer.id,
    anchor: ANCHOR,
    radiusM: RADIUS_M,
    people,
    blocks: BLOCKS.map((b) => {
      const blocker = byHandle.get(b.blocker);
      const blocked = byHandle.get(b.blocked);
      if (!blocker || !blocked) throw new Error(`block references unknown handle: ${b.blocker}/${b.blocked}`);
      return { blockerId: blocker.id, blockedId: blocked.id, note: b.note };
    }),
  };
}

const sqlStr = (value: string): string => `'${value.replace(/'/g, "''")}'`;

/** Idempotent SQL: safe to run repeatedly against the schema in db/schema.sql. */
function buildSql(seed: SeedFile): string {
  const lines: string[] = [
    '-- GENERATED FILE - run `npm run seed` to regenerate. Do not edit by hand.',
    `-- ${seed.seedDataNotice}`,
    '-- Every INSERT is an idempotent upsert, so re-running this file resets the',
    '-- demo rows without touching any other data.',
    'BEGIN;',
    '',
  ];

  for (const p of seed.people) {
    lines.push(
      `INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES (${[
        sqlStr(p.id),
        sqlStr(p.handle),
        sqlStr(p.displayName),
        sqlStr(p.avatarEmoji),
        sqlStr(p.headline),
        'TRUE',
      ].join(', ')})`,
      'ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,',
      '  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;',
    );
  }
  lines.push('');

  const attrKeys = new Map<string, { kind: string; slug: string; label: string }>();
  for (const p of seed.people) {
    for (const attr of p.attributes) {
      attrKeys.set(`${attr.kind}:${attr.slug}`, attr);
    }
  }
  for (const attr of attrKeys.values()) {
    lines.push(
      `INSERT INTO attribute_defs (kind, slug, label) VALUES (${sqlStr(attr.kind)}, ${sqlStr(
        attr.slug,
      )}, ${sqlStr(attr.label)}) ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;`,
    );
  }
  lines.push('');

  for (const p of seed.people) {
    for (const attr of p.attributes) {
      lines.push(
        `INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)`,
        `SELECT ${sqlStr(p.id)}, id, ${attr.weight ?? 1}, ${sqlStr(attr.visibility ?? 'public')}`,
        `FROM attribute_defs WHERE kind = ${sqlStr(attr.kind)} AND slug = ${sqlStr(attr.slug)}`,
        'ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;',
      );
    }
  }
  lines.push('');

  for (const p of seed.people) {
    const ghostUntil = p.presence.ghosted ? "now() + interval '1 hour'" : 'NULL';
    lines.push(
      `INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)`,
      `VALUES (${sqlStr(p.id)}, ST_SetSRID(ST_MakePoint(${p.presence.lng}, ${p.presence.lat}), 4326)::geography,`,
      `  ${p.presence.accuracyM}, ${p.presence.discoverable ? 'TRUE' : 'FALSE'}, ${ghostUntil}, now() - interval '${p.presence.fixAgeSeconds} seconds')`,
      'ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,',
      '  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;',
    );
  }
  lines.push('');

  for (const b of seed.blocks) {
    lines.push(
      `-- ${b.note}`,
      `INSERT INTO blocks (blocker_id, blocked_id) VALUES (${sqlStr(b.blockerId)}, ${sqlStr(
        b.blockedId,
      )}) ON CONFLICT DO NOTHING;`,
    );
  }

  lines.push('', 'COMMIT;', '');
  return lines.join('\n');
}

interface VerifyResult {
  people: number;
  presenceRows: number;
  totalRows: number;
  attributeRows: number;
  inRange: number;
  outOfRange: number;
  problems: string[];
}

function verify(seed: SeedFile): VerifyResult {
  const problems: string[] = [];
  const handles = new Set<string>();
  const ids = new Set<string>();

  for (const p of seed.people) {
    if (handles.has(p.handle)) problems.push(`duplicate handle: ${p.handle}`);
    if (ids.has(p.id)) problems.push(`duplicate id: ${p.id}`);
    handles.add(p.handle);
    ids.add(p.id);
    if (p.attributes.length === 0) problems.push(`${p.handle} has no attributes`);
    if (Math.abs(p.presence.lat) > 90) problems.push(`${p.handle} has an invalid latitude`);
    if (Math.abs(p.presence.lng) > 180) problems.push(`${p.handle} has an invalid longitude`);
  }

  if (seed.people.length !== 50) {
    problems.push(`expected 50 people, found ${seed.people.length}`);
  }

  const boundary = seed.people.find((p) => p.handle === 'liam_ostrich');
  if (!boundary || Math.abs(boundary.demo.designedDistanceM - 100) > 0.5) {
    problems.push('the exactly-100 m boundary probe is missing or has drifted');
  }
  const justOutside = seed.people.find((p) => p.handle === 'mira_halcyon');
  if (!justOutside || justOutside.demo.expectedInRange) {
    problems.push('the just-outside probe should not be expected in range');
  }

  const attributeRows = seed.people.reduce((n, p) => n + p.attributes.length, 0);

  return {
    people: seed.people.length,
    presenceRows: seed.people.length,
    totalRows: seed.people.length * 2,
    attributeRows,
    inRange: seed.people.filter((p) => p.demo.expectedInRange).length,
    outOfRange: seed.people.filter((p) => !p.demo.expectedInRange && p.handle !== VIEWER_HANDLE)
      .length,
    problems,
  };
}

function main(): void {
  const args = new Set(process.argv.slice(2));
  const seed = buildSeedFile();
  const result = verify(seed);

  if (args.has('--reset')) {
    rmSync(JSON_PATH, { force: true });
    rmSync(SQL_PATH, { force: true });
    console.log('reset: removed seed/seed-data.json and db/seed.sql');
  }

  if (!args.has('--verify')) {
    mkdirSync(dirname(JSON_PATH), { recursive: true });
    mkdirSync(dirname(SQL_PATH), { recursive: true });
    writeFileSync(JSON_PATH, `${JSON.stringify(seed, null, 2)}\n`);
    writeFileSync(SQL_PATH, buildSql(seed));
    console.log(`wrote seed/seed-data.json and db/seed.sql`);
  }

  console.log(
    [
      `people:            ${result.people}`,
      `presence rows:     ${result.presenceRows}`,
      `people + presence: ${result.totalRows} rows`,
      `attribute rows:    ${result.attributeRows}`,
      `expected in range: ${result.inRange}`,
      `expected excluded: ${result.outOfRange}`,
    ].join('\n'),
  );

  if (result.problems.length > 0) {
    console.error('\nseed verification FAILED:');
    for (const problem of result.problems) console.error(`  - ${problem}`);
    process.exit(1);
  }
  console.log('seed verification passed');
}

main();
