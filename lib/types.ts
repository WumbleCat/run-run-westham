export type AttributeKind =
  | 'company'
  | 'sport'
  | 'interest'
  | 'school'
  | 'language'
  | 'goal';

export type Visibility = 'public' | 'matches' | 'private';

export interface Attribute {
  kind: AttributeKind;
  slug: string;
  label: string;
  visibility?: Visibility;
  weight?: number;
}

export interface SeedPerson {
  id: string;
  handle: string;
  displayName: string;
  avatarEmoji: string;
  headline: string;
  attributes: Attribute[];
  presence: {
    lat: number;
    lng: number;
    accuracyM: number;
    discoverable: boolean;
    ghosted: boolean;
    fixAgeSeconds: number;
  };
  demo: {
    /** Straight-line metres from the demo viewer, as designed. */
    designedDistanceM: number;
    /** Why this row exists in the fixture set. */
    caseLabel: string;
    /** Whether this person should appear in the viewer's 100m results. */
    expectedInRange: boolean;
  };
}

export interface SeedFile {
  seedDataNotice: string;
  generatedBy: string;
  viewerId: string;
  anchor: { lat: number; lng: number; label: string };
  radiusM: number;
  people: SeedPerson[];
  blocks: Array<{ blockerId: string; blockedId: string; note: string }>;
}

export type DistanceBucket = '<25 m' | '25-50 m' | '50-100 m' | 'out of range';

export type Confidence = 'certain' | 'nearby';

export interface SharedAttribute {
  kind: AttributeKind;
  label: string;
}

export interface NearbyUser {
  id: string;
  handle: string;
  displayName: string;
  avatarEmoji: string;
  headline: string;
  distanceM: number;
  distanceBucket: DistanceBucket;
  bearingDeg: number;
  score: number;
  confidence: Confidence;
  shared: SharedAttribute[];
  hiddenSharedCount: number;
  encounterState: EncounterState;
  fixAgeSeconds: number;
}

export type EncounterState = 'seen' | 'waved' | 'matched' | 'declined' | 'blocked';

export interface NearbyResponse {
  generatedAt: string;
  radiusM: number;
  viewer: {
    id: string;
    displayName: string;
    discoverable: boolean;
    accuracyM: number;
  };
  users: NearbyUser[];
}
