'use client';

import { useCallback, useEffect, useMemo, useState } from 'react';

import { NearbyList } from '@/components/NearbyList';
import { PersonSheet } from '@/components/PersonSheet';
import { Radar } from '@/components/Radar';
import type { NearbyResponse } from '@/lib/types';

type PermissionPhase = 'idle' | 'requesting' | 'granted' | 'denied' | 'unsupported';

interface ProximityExplorerProps {
  initial: NearbyResponse;
  seedNotice: string;
  anchorLabel: string;
}

export function ProximityExplorer({ initial, seedNotice, anchorLabel }: ProximityExplorerProps) {
  const [data, setData] = useState<NearbyResponse>(initial);
  const [radiusM, setRadiusM] = useState(initial.radiusM);
  const [includeWeak, setIncludeWeak] = useState(false);
  const [discoverable, setDiscoverable] = useState(true);
  const [ghostMode, setGhostMode] = useState(false);
  const [phase, setPhase] = useState<PermissionPhase>('idle');
  const [position, setPosition] = useState<{ lat: number; lng: number; accuracyM: number } | null>(
    null,
  );
  const [selectedId, setSelectedId] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const hidden = !discoverable || ghostMode;

  const refresh = useCallback(async () => {
    const params = new URLSearchParams({ radius: String(radiusM) });
    if (includeWeak) params.set('includeWeak', 'true');
    if (position) {
      params.set('lat', String(position.lat));
      params.set('lng', String(position.lng));
      params.set('accuracy', String(position.accuracyM));
    }

    try {
      const response = await fetch(`/api/nearby?${params.toString()}`, { cache: 'no-store' });
      if (!response.ok) throw new Error(`nearby request failed (${response.status})`);
      setData((await response.json()) as NearbyResponse);
      setError(null);
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'nearby request failed');
    }
  }, [includeWeak, position, radiusM]);

  useEffect(() => {
    void refresh();
  }, [refresh]);

  const requestLocation = () => {
    if (typeof navigator === 'undefined' || !navigator.geolocation) {
      setPhase('unsupported');
      return;
    }
    setPhase('requesting');
    navigator.geolocation.getCurrentPosition(
      (pos) => {
        setPosition({
          lat: pos.coords.latitude,
          lng: pos.coords.longitude,
          accuracyM: Math.max(1, Math.round(pos.coords.accuracy)),
        });
        setPhase('granted');
      },
      () => setPhase('denied'),
      { enableHighAccuracy: true, timeout: 10_000, maximumAge: 30_000 },
    );
  };

  const users = useMemo(() => (hidden ? [] : data.users), [data.users, hidden]);
  const selected = users.find((user) => user.id === selectedId) ?? null;

  const act = async (action: 'wave' | 'decline' | 'block') => {
    if (!selected) return;
    setBusy(true);
    try {
      const response = await fetch(`/api/encounters/${selected.id}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ action }),
      });
      if (!response.ok) throw new Error(`action failed (${response.status})`);
      if (action !== 'wave') setSelectedId(null);
      await refresh();
    } catch (cause) {
      setError(cause instanceof Error ? cause.message : 'action failed');
    } finally {
      setBusy(false);
    }
  };

  return (
    <main className="mx-auto flex w-full max-w-5xl flex-col gap-6 px-4 py-6">
      <header className="space-y-2">
        <h1 className="font-display text-2xl font-bold tracking-tight sm:text-3xl">
          Run Run Westham · proximity radar
        </h1>
        <p className="text-sm text-slate-400">
          People within {data.radiusM} m who share your company, sports, school, languages, goals or
          interests. Centred on {anchorLabel}.
        </p>
        <p className="rounded-xl bg-amber-500/10 p-3 text-xs text-amber-200">{seedNotice}</p>
      </header>

      <section
        aria-label="Location and privacy controls"
        className="grid gap-3 rounded-2xl bg-surface-raised p-4 ring-1 ring-inset ring-white/10 sm:grid-cols-2"
      >
        <div className="space-y-2">
          <button
            type="button"
            onClick={requestLocation}
            className="rounded-xl bg-brand px-3 py-2 text-sm font-semibold text-white transition hover:bg-brand-soft"
          >
            {phase === 'granted' ? 'Refresh my location' : 'Use my real location'}
          </button>
          <p className="text-xs text-slate-400">
            {phase === 'granted' && position
              ? `Live fix · ±${position.accuracyM} m accuracy`
              : phase === 'denied'
                ? 'Permission denied - showing the demo anchor position instead.'
                : phase === 'unsupported'
                  ? 'Geolocation unavailable - showing the demo anchor position.'
                  : 'Optional. Without permission the demo anchor position is used; your coordinates are never stored.'}
          </p>
        </div>

        <div className="space-y-2 text-sm">
          <label className="flex items-center justify-between gap-3">
            <span>Discoverable</span>
            <input
              type="checkbox"
              checked={discoverable}
              onChange={(event) => setDiscoverable(event.target.checked)}
              className="h-4 w-4 accent-brand"
            />
          </label>
          <label className="flex items-center justify-between gap-3">
            <span>Ghost mode (see nobody, be seen by nobody)</span>
            <input
              type="checkbox"
              checked={ghostMode}
              onChange={(event) => setGhostMode(event.target.checked)}
              className="h-4 w-4 accent-brand"
            />
          </label>
          <label className="flex items-center justify-between gap-3">
            <span>Show weak matches</span>
            <input
              type="checkbox"
              checked={includeWeak}
              onChange={(event) => setIncludeWeak(event.target.checked)}
              className="h-4 w-4 accent-brand"
            />
          </label>
          <label className="block">
            <span className="flex items-center justify-between gap-3">
              <span>Radius</span>
              <span className="text-slate-400">{radiusM} m</span>
            </span>
            <input
              type="range"
              min={25}
              max={500}
              step={25}
              value={radiusM}
              onChange={(event) => setRadiusM(Number(event.target.value))}
              className="mt-1 w-full accent-brand"
            />
          </label>
        </div>
      </section>

      {error && (
        <p role="alert" className="rounded-xl bg-rose-500/15 p-3 text-sm text-rose-200">
          {error}
        </p>
      )}

      {hidden ? (
        <p className="rounded-2xl bg-surface-raised p-6 text-center text-sm text-slate-300">
          You are hidden. {ghostMode ? 'Ghost mode' : 'Discoverability'} is off, so nobody sees you
          and you see nobody.
        </p>
      ) : (
        <div className="grid gap-6 lg:grid-cols-[minmax(0,1fr)_minmax(0,1fr)]">
          <div className="space-y-4">
            <Radar
              users={users}
              radiusM={data.radiusM}
              selectedId={selectedId}
              onSelect={setSelectedId}
            />
            <p className="text-center text-xs text-slate-500">
              {users.length} discoverable {users.length === 1 ? 'person' : 'people'} in range ·
              bearings are jittered, exact coordinates are never sent to the browser
            </p>
            {selected && (
              <PersonSheet
                user={selected}
                busy={busy}
                onAction={act}
                onClose={() => setSelectedId(null)}
              />
            )}
          </div>
          <NearbyList users={users} selectedId={selectedId} onSelect={setSelectedId} />
        </div>
      )}
    </main>
  );
}
