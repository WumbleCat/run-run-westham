import { ProximityExplorer } from '@/components/ProximityExplorer';
import { ANCHOR, SEED_NOTICE, findNearby } from '@/lib/store';

export const dynamic = 'force-dynamic';

export default function HomePage() {
  return (
    <ProximityExplorer
      initial={findNearby()}
      seedNotice={SEED_NOTICE}
      anchorLabel={ANCHOR.label}
    />
  );
}
