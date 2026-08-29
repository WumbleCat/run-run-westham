import { NextResponse } from 'next/server';

import { getEncounterState, getPerson, getViewer, setEncounterState } from '@/lib/store';
import type { EncounterState } from '@/lib/types';

export const dynamic = 'force-dynamic';

const ACTIONS = new Set(['wave', 'decline', 'block']);

/**
 * POST /api/encounters/:targetId  { "action": "wave" | "decline" | "block" }
 *
 * The demo's other side is a fixture, so a wave resolves straight to `matched`;
 * a real deployment waits for the other user's wave before unlocking anything.
 */
export async function POST(
  request: Request,
  { params }: { params: { id: string } },
): Promise<NextResponse> {
  const viewer = getViewer();
  const target = getPerson(params.id);
  if (!target) {
    return NextResponse.json({ error: 'unknown user' }, { status: 404 });
  }

  let action: unknown;
  try {
    action = ((await request.json()) as { action?: unknown }).action;
  } catch {
    return NextResponse.json({ error: 'body must be JSON' }, { status: 400 });
  }
  if (typeof action !== 'string' || !ACTIONS.has(action)) {
    return NextResponse.json(
      { error: `action must be one of ${[...ACTIONS].join(', ')}` },
      { status: 400 },
    );
  }

  const next: EncounterState =
    action === 'wave' ? 'matched' : action === 'decline' ? 'declined' : 'blocked';
  setEncounterState(viewer.id, target.id, next);

  return NextResponse.json(
    { targetId: target.id, state: getEncounterState(viewer.id, target.id) },
    { headers: { 'Cache-Control': 'no-store' } },
  );
}
