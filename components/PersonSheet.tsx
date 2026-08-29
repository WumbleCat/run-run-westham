'use client';

import type { EncounterState, NearbyUser } from '@/lib/types';

interface PersonSheetProps {
  user: NearbyUser;
  busy: boolean;
  onAction: (action: 'wave' | 'decline' | 'block') => void;
  onClose: () => void;
}

const STATE_LABEL: Record<EncounterState, string> = {
  seen: 'Not contacted yet',
  waved: 'Wave sent',
  matched: 'Matched - exact distance unlocked',
  declined: 'Declined - hidden from your radar',
  blocked: 'Blocked - hidden both ways',
};

export function PersonSheet({ user, busy, onAction, onClose }: PersonSheetProps) {
  return (
    <section
      aria-label={`Profile: ${user.displayName}`}
      className="rounded-2xl bg-surface-raised p-4 ring-1 ring-inset ring-white/10"
    >
      <div className="flex items-start gap-3">
        <span className="flex h-12 w-12 items-center justify-center rounded-full bg-white/5 text-2xl">
          {user.avatarEmoji}
        </span>
        <div className="min-w-0 flex-1">
          <h2 className="truncate font-display text-lg font-bold">{user.displayName}</h2>
          <p className="truncate text-xs text-slate-400">
            @{user.handle} · {user.headline}
          </p>
        </div>
        <button
          type="button"
          onClick={onClose}
          className="rounded-lg px-2 py-1 text-sm text-slate-400 hover:bg-white/5 hover:text-slate-200"
        >
          Close
        </button>
      </div>

      <dl className="mt-3 grid grid-cols-3 gap-2 text-center">
        <div className="rounded-xl bg-black/20 p-2">
          <dt className="text-[10px] uppercase tracking-wide text-slate-500">Distance</dt>
          <dd className="text-sm font-semibold">{user.distanceBucket}</dd>
        </div>
        <div className="rounded-xl bg-black/20 p-2">
          <dt className="text-[10px] uppercase tracking-wide text-slate-500">Match</dt>
          <dd className="text-sm font-semibold text-brand-soft">{user.score}</dd>
        </div>
        <div className="rounded-xl bg-black/20 p-2">
          <dt className="text-[10px] uppercase tracking-wide text-slate-500">Fix age</dt>
          <dd className="text-sm font-semibold">{user.fixAgeSeconds}s</dd>
        </div>
      </dl>

      <p className="mt-3 text-xs text-slate-400">{STATE_LABEL[user.encounterState]}</p>

      <h3 className="mt-3 text-xs font-semibold uppercase tracking-wide text-slate-500">
        What you have in common
      </h3>
      <ul className="mt-1 flex flex-wrap gap-1">
        {user.shared.map((attr) => (
          <li
            key={`${attr.kind}:${attr.label}`}
            className="rounded-full bg-brand/20 px-2 py-0.5 text-xs text-brand-soft"
          >
            {attr.label}
            <span className="ml-1 text-[10px] text-slate-400">{attr.kind}</span>
          </li>
        ))}
        {user.shared.length === 0 && (
          <li className="text-xs text-slate-500">No shareable overlap yet.</li>
        )}
      </ul>
      {user.hiddenSharedCount > 0 && (
        <p className="mt-2 text-xs text-slate-500">
          {user.hiddenSharedCount} shared attribute{user.hiddenSharedCount === 1 ? '' : 's'} stay
          hidden until you both wave.
        </p>
      )}

      <div className="mt-4 flex flex-wrap gap-2">
        <button
          type="button"
          disabled={busy}
          onClick={() => onAction('wave')}
          className="rounded-xl bg-brand px-3 py-2 text-sm font-semibold text-white transition hover:bg-brand-soft disabled:opacity-50"
        >
          👋 Wave
        </button>
        <button
          type="button"
          disabled={busy}
          onClick={() => onAction('decline')}
          className="rounded-xl bg-white/5 px-3 py-2 text-sm text-slate-200 transition hover:bg-white/10 disabled:opacity-50"
        >
          Not interested
        </button>
        <button
          type="button"
          disabled={busy}
          onClick={() => onAction('block')}
          className="rounded-xl bg-rose-500/20 px-3 py-2 text-sm text-rose-200 transition hover:bg-rose-500/30 disabled:opacity-50"
        >
          Block &amp; report
        </button>
      </div>
    </section>
  );
}
