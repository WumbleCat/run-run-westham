import type { Metadata, Viewport } from 'next';

import './globals.css';

export const metadata: Metadata = {
  title: 'Run Run Westham - proximity radar',
  description:
    'Find people within 100 metres who share your company, sports and interests. Demo build using entirely fictional seed data.',
};

export const viewport: Viewport = {
  width: 'device-width',
  initialScale: 1,
  themeColor: '#05070f',
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body className="min-h-screen bg-surface-base text-slate-100 antialiased">{children}</body>
    </html>
  );
}
