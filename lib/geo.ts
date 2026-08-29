import type { DistanceBucket } from '@/lib/types';

const EARTH_RADIUS_M = 6_371_008.8;

const toRad = (deg: number): number => (deg * Math.PI) / 180;
const toDeg = (rad: number): number => (rad * 180) / Math.PI;

/** Great-circle distance in metres. Handles antimeridian pairs correctly. */
export function distanceMeters(
  a: { lat: number; lng: number },
  b: { lat: number; lng: number },
): number {
  const phi1 = toRad(a.lat);
  const phi2 = toRad(b.lat);
  const dPhi = phi2 - phi1;
  const dLambda = toRad(b.lng - a.lng);
  const h =
    Math.sin(dPhi / 2) ** 2 +
    Math.cos(phi1) * Math.cos(phi2) * Math.sin(dLambda / 2) ** 2;
  return 2 * EARTH_RADIUS_M * Math.asin(Math.min(1, Math.sqrt(h)));
}

/** Initial bearing from `a` to `b`, degrees clockwise from true north. */
export function bearingDegrees(
  a: { lat: number; lng: number },
  b: { lat: number; lng: number },
): number {
  const phi1 = toRad(a.lat);
  const phi2 = toRad(b.lat);
  const dLambda = toRad(b.lng - a.lng);
  const y = Math.sin(dLambda) * Math.cos(phi2);
  const x =
    Math.cos(phi1) * Math.sin(phi2) -
    Math.sin(phi1) * Math.cos(phi2) * Math.cos(dLambda);
  return (toDeg(Math.atan2(y, x)) + 360) % 360;
}

/** Point at `distanceM` along `bearingDeg` from `origin`. Used by the seed generator. */
export function destinationPoint(
  origin: { lat: number; lng: number },
  distanceM: number,
  bearingDeg: number,
): { lat: number; lng: number } {
  const delta = distanceM / EARTH_RADIUS_M;
  const theta = toRad(bearingDeg);
  const phi1 = toRad(origin.lat);
  const lambda1 = toRad(origin.lng);
  const phi2 = Math.asin(
    Math.sin(phi1) * Math.cos(delta) +
      Math.cos(phi1) * Math.sin(delta) * Math.cos(theta),
  );
  const lambda2 =
    lambda1 +
    Math.atan2(
      Math.sin(theta) * Math.sin(delta) * Math.cos(phi1),
      Math.cos(delta) - Math.sin(phi1) * Math.sin(phi2),
    );
  return {
    lat: round7(toDeg(phi2)),
    lng: round7(((toDeg(lambda2) + 540) % 360) - 180),
  };
}

const round7 = (n: number): number => Math.round(n * 1e7) / 1e7;

/**
 * Coarse distance band shown before two users match. Exact metres are never
 * exposed for a non-matched user (see privacy notes in the back-end skill doc).
 */
export function distanceBucket(distanceM: number, radiusM = 100): DistanceBucket {
  if (distanceM > radiusM) return 'out of range';
  if (distanceM < 25) return '<25 m';
  if (distanceM <= 50) return '25-50 m';
  return '50-100 m';
}

/**
 * `certain` when the reported distance is inside the radius even after both
 * sides' GPS error is added; otherwise the pair is only plausibly in range.
 */
export function confidence(
  distanceM: number,
  viewerAccuracyM: number,
  targetAccuracyM: number,
  radiusM = 100,
): 'certain' | 'nearby' {
  return distanceM + viewerAccuracyM + targetAccuracyM <= radiusM
    ? 'certain'
    : 'nearby';
}

/**
 * Stable per-pair angular jitter so a viewer cannot average repeated samples to
 * trilaterate a real position, while markers stay put between polls.
 */
export function jitterBearing(
  bearing: number,
  viewerId: string,
  targetId: string,
  maxDeg = 12,
): number {
  const seed = `${viewerId}:${targetId}`;
  let hash = 2166136261;
  for (let i = 0; i < seed.length; i += 1) {
    hash ^= seed.charCodeAt(i);
    hash = Math.imul(hash, 16777619);
  }
  const unit = ((hash >>> 0) % 1000) / 1000; // 0..1
  return (bearing + (unit * 2 - 1) * maxDeg + 360) % 360;
}
