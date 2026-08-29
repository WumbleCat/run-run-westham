'use client';

import type { NearbyUser } from '@/lib/types';

interface NearbyListProps {
  users: NearbyUser[];
  selectedId: string | null;
  onSelect: (id: string) => void;
}

/** Accessible, screen-reader-friendly equivalent of the radar. */
export function NearbyList({ users, selectedId, onSelect }: NearbyListProps) {
  if (users.length === 0) {
    return (
      <p className="rounded-xl bg-surface-raised p-4 text-sm text-slate-400">
        Nobody discoverable within range right now. Move the demo position or widen the radius.
      </p>
    );
  }

  return (
    <ul className="space-y-2">
      {users.map((user) => (
        <li key={user.id}>
          <button
            type="button"
            onClick={() => onSelect(user.id)}
            aria-pressed={selectedId === user.id}
            className={`w-full rounded-xl bg-surface-raised p-3 text-left transition hover:bg-white/5 focus:outline-none focus-visible:ring-2 focus-visible:ring-brand-soft ${
              selectedId === user.id ? 'ring-2 ring-brand-soft' : ''
            }`}
          >
            <div className="flex items-center gap-3">
              <span className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-white/5 text-lg">
                {user.avatarEmoji}
              </span>
              <div className="min-w-0 flex-1">
                <div className="flex items-baseline justify-between gap-2">
                  <p className="truncate font-semibold">{user.displayName}</p>
                  <p className="shrink-0 text-sm font-bold text-brand-soft">{user.score}</p>
                </div>
                <p className="truncate text-xs text-slate-400">{user.headline}</p>
                <p className="mt-1 text-xs text-slate-500">
                  {user.distanceBucket}
                  {user.confidence === 'nearby' ? ' · approximate' : ''}
                </p>
              </div>
            </div>
            {user.shared.length > 0 && (
              <ul className="mt-2 flex flex-wrap gap-1">
                {user.shared.slice(0, 4).map((attr) => (
                  <li
                    key={`${attr.kind}:${attr.label}`}
                    className="rounded-full bg-brand/20 px-2 py-0.5 text-[11px] text-brand-soft"
                  >
                    {attr.label}
                  </li>
                ))}
                {user.hiddenSharedCount > 0 && (
                  <li className="rounded-full bg-white/5 px-2 py-0.5 text-[11px] text-slate-400">
                    +{user.hiddenSharedCount} hidden until you match
                  </li>
                )}
              </ul>
            )}
          </button>
        </li>
      ))}
    </ul>
  );
}
