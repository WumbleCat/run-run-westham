import { describe, expect, it } from 'vitest';

import {
  bearingDegrees,
  confidence,
  destinationPoint,
  distanceBucket,
  distanceMeters,
  jitterBearing,
} from '@/lib/geo';

const ANCHOR = { lat: 51.5386, lng: -0.0166 };

describe('distanceMeters', () => {
  it('is zero for the same point', () => {
    expect(distanceMeters(ANCHOR, ANCHOR)).toBe(0);
  });

  it('round-trips destinationPoint within 1 cm', () => {
    for (const metres of [1, 25, 50, 99, 100, 101, 480]) {
      for (const bearing of [0, 37, 180, 275, 359]) {
        const target = destinationPoint(ANCHOR, metres, bearing);
        expect(distanceMeters(ANCHOR, target)).toBeCloseTo(metres, 2);
      }
    }
  });

  it('measures across the antimeridian by the short way round', () => {
    const west = { lat: -16.5, lng: 179.9999 };
    const east = { lat: -16.5, lng: -179.9999 };
    expect(distanceMeters(west, east)).toBeLessThan(30);
  });

  it('handles polar coordinates without blowing up', () => {
    const pole = { lat: 89.9, lng: 42 };
    expect(distanceMeters(pole, destinationPoint(pole, 100, 90))).toBeCloseTo(100, 1);
  });
});

describe('distanceBucket', () => {
  it('places distances in inclusive-upper bands', () => {
    expect(distanceBucket(0)).toBe('<25 m');
    expect(distanceBucket(24.9)).toBe('<25 m');
    expect(distanceBucket(25)).toBe('25-50 m');
    expect(distanceBucket(50)).toBe('25-50 m');
    expect(distanceBucket(50.1)).toBe('50-100 m');
    expect(distanceBucket(100)).toBe('50-100 m');
    expect(distanceBucket(100.6)).toBe('out of range');
  });
});

describe('bearingDegrees', () => {
  it('returns compass bearings clockwise from north', () => {
    expect(bearingDegrees(ANCHOR, destinationPoint(ANCHOR, 50, 0))).toBeCloseTo(0, 1);
    expect(bearingDegrees(ANCHOR, destinationPoint(ANCHOR, 50, 90))).toBeCloseTo(90, 1);
    expect(bearingDegrees(ANCHOR, destinationPoint(ANCHOR, 50, 270))).toBeCloseTo(270, 1);
  });
});

describe('confidence', () => {
  it('is certain only when accuracy cannot push the pair out of range', () => {
    expect(confidence(40, 5, 5, 100)).toBe('certain');
    expect(confidence(95, 5, 5, 100)).toBe('nearby');
    expect(confidence(60, 80, 5, 100)).toBe('nearby');
  });
});

describe('jitterBearing', () => {
  it('is stable per pair and bounded', () => {
    const first = jitterBearing(90, 'viewer', 'target');
    expect(jitterBearing(90, 'viewer', 'target')).toBe(first);
    expect(Math.abs(((first - 90 + 540) % 360) - 180)).toBeLessThanOrEqual(12);
  });

  it('differs between targets so markers do not line up', () => {
    expect(jitterBearing(90, 'viewer', 'a')).not.toBe(jitterBearing(90, 'viewer', 'b'));
  });
});
