import { NextResponse } from 'next/server';

import { listPeople } from '@/lib/store';

export const dynamic = 'force-dynamic';

export function GET(): NextResponse {
  return NextResponse.json(
    { status: 'ok', seedPeople: listPeople().length },
    { headers: { 'Cache-Control': 'no-store' } },
  );
}
