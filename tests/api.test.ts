import { afterEach, describe, expect, it } from 'vitest';

import { GET as getHealth } from '@/app/api/health/route';
import { GET as getNearby } from '@/app/api/nearby/route';
import { GET as getSeed } from '@/app/api/seed/route';
import { POST as postEncounter } from '@/app/api/encounters/[id]/route';
import { findNearby, getViewer, resetEncounterStates } from '@/lib/store';
import type { NearbyResponse } from '@/lib/types';

const nearby = (query = ''): Response =>
  getNearby(new Request(`http://localhost/api/nearby${query}`));

const encounter = (id: string, body: unknown): Promise<Response> =>
  postEncounter(
    new Request(`http://localhost/api/encounters/${id}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: typeof body === 'string' ? body : JSON.stringify(body),
    }),
    { params: { id } },
  );

afterEach(() => resetEncounterStates());

describe('GET /api/nearby', () => {
  it('returns the viewer summary and in-range users', async () => {
    const response = nearby();
    expect(response.status).toBe(200);
    expect(response.headers.get('Cache-Control')).toBe('no-store');

    const body = (await response.json()) as NearbyResponse;
    expect(body.radiusM).toBe(100);
    expect(body.viewer.id).toBe(getViewer().id);
    expect(body.users.length).toBeGreaterThan(0);
    expect(Date.parse(body.generatedAt)).not.toBeNaN();
  });

  it('accepts a live position and an explicit radius', async () => {
    const body = (await nearby('?lat=51.5386&lng=-0.0166&accuracy=12&radius=50').json()) as NearbyResponse;
    expect(body.radiusM).toBe(50);
    expect(body.viewer.accuracyM).toBe(12);
    expect(body.users.every((u) => u.distanceM <= 50)).toBe(true);
  });

  it('clamps an absurd radius instead of failing', async () => {
    expect(((await nearby('?radius=99999').json()) as NearbyResponse).radiusM).toBe(500);
  });

  it('rejects half a coordinate pair and out-of-range values', async () => {
    expect(nearby('?lat=51.5').status).toBe(400);
    expect(nearby('?lat=91&lng=0').status).toBe(400);
    expect(nearby('?lat=0&lng=181').status).toBe(400);
    expect(nearby('?lat=0&lng=0&accuracy=0').status).toBe(400);
  });
});

describe('POST /api/encounters/:id', () => {
  const targetId = () => findNearby().users[0].id;

  it('waves, declines and blocks', async () => {
    const id = targetId();
    expect(await (await encounter(id, { action: 'wave' })).json()).toEqual({
      targetId: id,
      state: 'matched',
    });
    expect(await (await encounter(id, { action: 'decline' })).json()).toEqual({
      targetId: id,
      state: 'declined',
    });
    expect(await (await encounter(id, { action: 'block' })).json()).toEqual({
      targetId: id,
      state: 'blocked',
    });
  });

  it('removes a blocked person from later results', async () => {
    const id = targetId();
    await encounter(id, { action: 'block' });
    expect(findNearby().users.map((u) => u.id)).not.toContain(id);
  });

  it('validates the target and the action', async () => {
    expect((await encounter('11111111-1111-1111-1111-111111111111', { action: 'wave' })).status).toBe(404);
    expect((await encounter(targetId(), { action: 'shout' })).status).toBe(400);
    expect((await encounter(targetId(), 'not json')).status).toBe(400);
  });
});

describe('metadata routes', () => {
  it('GET /api/health reports the loaded fixture size', async () => {
    expect(await (await getHealth()).json()).toEqual({ status: 'ok', seedPeople: 50 });
  });

  it('GET /api/seed describes the demo cases without leaking coordinates', async () => {
    const body = (await getSeed().json()) as {
      notice: string;
      counts: { people: number; totalRows: number };
      cases: Array<{ handle: string; caseLabel: string }>;
    };
    expect(body.notice).toMatch(/SEED\/DEMO DATA/);
    expect(body.counts).toMatchObject({ people: 50, totalRows: 100 });
    expect(body.cases).toHaveLength(50);
    expect(JSON.stringify(body.cases)).not.toMatch(/"lat"|"lng"/);
  });
});
