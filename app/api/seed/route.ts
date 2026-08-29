import { NextResponse } from 'next/server';

import { ANCHOR, DEFAULT_RADIUS_M, SEED_NOTICE, getViewer, listPeople } from '@/lib/store';

export const dynamic = 'force-dynamic';

/**
 * GET /api/seed - fixture metadata for the demo panel: which rows exist, what
 * each one is testing, and whether it should be inside the radius.
 */
export function GET(): NextResponse {
  const people = listPeople();
  const viewer = getViewer();

  return NextResponse.json(
    {
      notice: SEED_NOTICE,
      anchor: ANCHOR,
      radiusM: DEFAULT_RADIUS_M,
      viewer: { id: viewer.id, handle: viewer.handle, displayName: viewer.displayName },
      counts: {
        people: people.length,
        presenceRows: people.length,
        totalRows: people.length * 2,
        attributeRows: people.reduce((n, p) => n + p.attributes.length, 0),
        expectedInRange: people.filter((p) => p.demo.expectedInRange).length,
      },
      cases: people.map((p) => ({
        handle: p.handle,
        displayName: p.displayName,
        distanceM: p.demo.designedDistanceM,
        caseLabel: p.demo.caseLabel,
        expectedInRange: p.demo.expectedInRange,
        accuracyM: p.presence.accuracyM,
        fixAgeSeconds: p.presence.fixAgeSeconds,
        discoverable: p.presence.discoverable,
        ghosted: p.presence.ghosted,
      })),
    },
    { headers: { 'Cache-Control': 'no-store' } },
  );
}
