'use client';

import type { NearbyUser } from '@/lib/types';

const BAND_COLOR: Record<string, string> = {
  '<25 m': 'bg-proximity-near',
  '25-50 m': 'bg-proximity-mid',
  '50-100 m': 'bg-proximity-far',
  'out of range': 'bg-proximity-out',
};

interface RadarProps {
  users: NearbyUser[];
  radiusM: number;
  selectedId: string | null;
  onSelect: (id: string) => void;
}

/**
 * Pokemon-Go-style radar. Markers are placed from the server-provided bearing
 * (already jittered) and quantised distance, so the view never implies a
 * precision the API does not give.
 */
export function Radar({ users, radiusM, selectedId, onSelect }: RadarProps) {
  return (
    <div className="relative mx-auto aspect-square w-full max-w-md">
      <div className="absolute inset-0 rounded-full bg-surface-sunken ring-1 ring-inset ring-white/10" />

      {[0.25, 0.5, 1].map((fraction) => (
        <div
          key={fraction}
          className="absolute rounded-full border border-white/10"
          style={{
            inset: `${(1 - fraction) * 50}%`,
          }}
        >
          <span className="absolute left-1/2 top-1 -translate-x-1/2 text-[10px] font-medium tracking-wide text-slate-500">
            {Math.round(radiusM * fraction)} m
          </span>
        </div>
      ))}

      <div className="pointer-events-none absolute inset-0 overflow-hidden rounded-full">
        <div className="absolute left-1/2 top-1/2 h-1/2 w-1/2 origin-top-left animate-sweep bg-gradient-to-r from-brand-soft/25 to-transparent" />
      </div>

      <div className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2">
        <span className="absolute -inset-3 animate-ping-soft rounded-full bg-brand/40" />
        <span className="relative flex h-7 w-7 items-center justify-center rounded-full bg-brand text-sm shadow-lg shadow-brand/40">
          🧭
        </span>
        <span className="sr-only">You are at the centre of the radar</span>
      </div>

      {users.map((user) => {
        const ratio = Math.min(1, user.distanceM / radiusM);
        const rad = (user.bearingDeg - 90) * (Math.PI / 180);
        const left = 50 + Math.cos(rad) * ratio * 46;
        const top = 50 + Math.sin(rad) * ratio * 46;
        const selected = selectedId === user.id;

        return (
          <button
            key={user.id}
            type="button"
            onClick={() => onSelect(user.id)}
            aria-pressed={selected}
            className={`absolute -translate-x-1/2 -translate-y-1/2 rounded-full p-0.5 transition focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-soft ${
              selected ? 'ring-2 ring-brand-soft' : ''
            }`}
            style={{ left: `${left}%`, top: `${top}%` }}
          >
            <span
              className={`flex h-9 w-9 items-center justify-center rounded-full text-base shadow-md ${
                BAND_COLOR[user.distanceBucket] ?? 'bg-proximity-out'
              }`}
            >
              {user.avatarEmoji}
            </span>
            <span className="sr-only">
              {user.displayName}, {user.distanceBucket}, match score {user.score}
            </span>
          </button>
        );
      })}
    </div>
  );
}
