import { NextResponse } from 'next/server';

import { clampRadius, findNearby } from '@/lib/store';

export const dynamic = 'force-dynamic';

/**
 * GET /api/nearby?lat=&lng=&accuracy=&radius=&includeWeak=
 *
 * Coordinates are optional: without them the seed viewer's fixture position is
 * used, which is what the demo does when location permission is denied.
 */
export function GET(request: Request): NextResponse {
  const params = new URL(request.url).searchParams;

  const lat = numberParam(params.get('lat'));
  const lng = numberParam(params.get('lng'));
  if ((lat === undefined) !== (lng === undefined)) {
    return NextResponse.json({ error: 'lat and lng must be provided together' }, { status: 400 });
  }
  if (lat !== undefined && (lat < -90 || lat > 90)) {
    return NextResponse.json({ error: 'lat out of range' }, { status: 400 });
  }
  if (lng !== undefined && (lng < -180 || lng > 180)) {
    return NextResponse.json({ error: 'lng out of range' }, { status: 400 });
  }

  const accuracyM = numberParam(params.get('accuracy'));
  if (accuracyM !== undefined && (accuracyM <= 0 || accuracyM > 5000)) {
    return NextResponse.json({ error: 'accuracy out of range' }, { status: 400 });
  }

  const radiusParam = numberParam(params.get('radius'));

  const body = findNearby({
    lat,
    lng,
    accuracyM,
    radiusM: radiusParam === undefined ? undefined : clampRadius(radiusParam),
    includeWeakMatches: params.get('includeWeak') === 'true',
  });

  return NextResponse.json(body, { headers: { 'Cache-Control': 'no-store' } });
}

function numberParam(raw: string | null): number | undefined {
  if (raw === null || raw.trim() === '') return undefined;
  const value = Number(raw);
  return Number.isFinite(value) ? value : undefined;
}
