---
name: gps-proximity-matching-frontend
description: Front-end implementation guide for a Pokémon Go-style GPS proximity matching app — live map with nearby users within 100 m ranked by shared attributes (company, sports, interests). Covers location permission UX, map/radar interaction, realtime state, and the Tailwind-only styling rule. Use when building or changing any client-side screen of this app.
---

# GPS Proximity Matching — Front End

## Scope

The client for a "who is near me and worth meeting" app: a live map/radar centred on the user, avatars for nearby people (default radius 100 m), a shared-attribute rationale on every card, and wave/match/chat flows. Pairs with `gps-proximity-matching-backend`, which owns the API contract referenced here.

## Styling rule — Tailwind CSS only

**Tailwind CSS is the only styling system in this codebase.** This is a hard constraint, not a preference:

- Do not add Bootstrap, Material UI, Chakra, Ant Design, styled-components, Emotion, CSS Modules, SCSS/Sass, or any other CSS framework, component library with bundled styles, or CSS-in-JS runtime.
- Style with Tailwind utility classes in markup. Compose variants with `clsx`/`tailwind-merge` and, where a pattern truly repeats, `@apply` inside the single global stylesheet — not with new stylesheets per component.
- The only global CSS permitted is the minimal Tailwind setup: `@tailwind base; @tailwind components; @tailwind utilities;` plus a small `@layer base` block for things utilities cannot express (font-face, `:root` CSS variables for the design tokens, `color-scheme`, and map-library overrides that require targeting third-party DOM, e.g. `.maplibregl-ctrl`). Keep it under ~60 lines; if it grows, move the pattern into `tailwind.config.js` (theme tokens, plugins) instead.
- Design tokens (brand colours, spacing scale, radii, the proximity ring colours) live in `tailwind.config.js` `theme.extend`, referenced as utilities like `bg-proximity-near`. No hardcoded hex values in components.
- Arbitrary values (`h-[calc(100dvh-4rem)]`) are fine and preferred over a new CSS file.
- Third-party map libraries ship their own CSS (e.g. `maplibre-gl/dist/maplibre-gl.css`). Importing that one required stylesheet is allowed — it is a dependency's baseline, not a competing styling system. Override it with Tailwind utilities on wrapper elements, or in the `@layer base` block when the DOM is not ours.

Reviewer checklist: no new `.css`/`.scss` files, no `styled`/`css` template literals, no `style={{...}}` beyond dynamic geometry (map marker transforms, radar sweep angle, computed positions), no non-Tailwind UI dependency in `package.json`.

## Recommended stack

React + TypeScript (Vite or Next.js App Router), MapLibre GL JS for the map (open, no token lock-in; Mapbox GL is a drop-in if a token exists), TanStack Query for server state, a small Zustand store for live position/permission state, and Tailwind for everything visual. Framer Motion for marker/ring animation is acceptable — it emits inline transforms, not stylesheets.

## Location permission flow

Never call the geolocation API cold. Sequence:

1. **Value screen first** — explain what the app does with location, in one sentence, with a visual of the 100 m radius, before any OS prompt. Show two buttons: "Enable location" and "Not now". You get one shot at the OS prompt on iOS; a denied permission is very expensive to recover.
2. **Request on explicit tap** only, then `navigator.geolocation.watchPosition(success, error, { enableHighAccuracy: true, maximumAge: 10_000, timeout: 15_000 })`. On native wrappers request when-in-use, never always-on, until the user opts into background discovery separately.
3. **Handle every terminal state with a distinct UI**, all reachable in dev via a debug menu:
   - `granted` → live map.
   - `prompt` → value screen.
   - `denied` → a permanent explainer card with OS-specific instructions to re-enable in Settings; the app remains usable (profile, existing chats, attribute editing). Do not loop the prompt.
   - `unavailable` / `POSITION_UNAVAILABLE` / timeout → "Can't get a fix" state with retry, plus indoor-accuracy hint.
   - `accuracy_m > 150` → show the map but replace avatars with a "low accuracy, move outdoors" banner; do not display distances you cannot back up.
4. **Discoverability is a separate, explicit toggle** from permission. Permission granted ≠ visible to others. Surface the toggle in the top bar at all times with unambiguous copy ("You're visible to people within 100 m" / "You're invisible"), plus a one-tap **Ghost mode** (15/60 min) and a "Go invisible & clear my location" action that calls `DELETE /v1/presence`.
5. Use `navigator.permissions.query({ name: 'geolocation' })` where available to render the right state on load without triggering a prompt, and listen to its `change` event so revoking in Settings updates the UI live.

## Sending and receiving position

- Foreground: post `/v1/presence` on a 10 s throttle, and additionally whenever the user has moved > 20 m since the last successful post. Skip posts when `accuracy_m > 150` unless nothing has been sent in 60 s.
- Background/hidden tab: stop `watchPosition` on `visibilitychange`, resume on focus, and immediately refetch `/v1/nearby` — a stale nearby list is worse than an empty one.
- Battery: drop to `enableHighAccuracy: false` and a 60 s cadence when `navigator.getBattery()` reports < 20% or the user enables Battery saver; tell the server via `battery_saver: true` so it can widen `next_ping_seconds`.
- Nearby data: `GET /v1/nearby` via TanStack Query with `staleTime: 5_000`, plus the WebSocket `nearby.updated` event invalidating the query. Treat the socket as an accelerator, never the only path — always keep the polling fallback alive when the socket is down.
- Render `generated_at` staleness: after 30 s without an update, dim the map and show "Updating…"; after 2 min show a reconnect button. Never leave stale avatars looking live.

## Map & radar interaction

The core screen is a Pokémon Go-style egocentric view:

- **Self marker** at the centre: an avatar puck with a heading cone if `coords.heading` is available, and a translucent accuracy circle sized to the real `accuracy_m` (map units, not pixels) so the user understands their own uncertainty.
- **Proximity rings** at 25 / 50 / 100 m drawn as MapLibre circle layers in meters (compute pixel radius from `map.getZoom()` and latitude, or use a GeoJSON circle polygon so the ring scales correctly with zoom). Colour them from Tailwind tokens (`proximity-near`, `proximity-mid`, `proximity-far`).
- **Nearby avatars** placed on the *bucketed, server-jittered* position the API returns. The client must not attempt to reconstruct exact positions, and must not draw an avatar closer than its distance bucket allows — the honest visual is a marker on the ring band, optionally with a small random angular offset that is stable per session (recompute only when the server's jitter epoch changes, otherwise markers jitter-dance every poll).
- **Score presentation**: ring the avatar with a stroke whose thickness/colour maps to match score, and show the top shared attribute as a chip under the avatar ("Acme Corp", "5-a-side"). The rationale is the product — never show a bare percentage without at least one named shared attribute.
- **Clustering**: at > 8 avatars in a band, cluster into a "+5 nearby" puck that expands into a bottom sheet list. Never overlap avatars into an unreadable pile.
- **Interactions**: tap avatar → bottom sheet with profile preview, shared attributes, distance bucket, and Wave / Dismiss / Report; long-press → quick Wave; pull-up on the sheet → full nearby list sorted by score (the accessible equivalent of the map, and the fallback when the map fails to load); pinch/zoom clamped to a 30–400 m viewport so the experience stays local; a "recentre" FAB whenever the map is panned off self.
- **Radar fallback**: when WebGL is unavailable, render a pure-Tailwind/SVG radar — concentric rings, avatars positioned by bearing and band. Ship this; a meaningful share of low-end devices land here.
- **Animation**: markers tween to new positions over ~400 ms rather than teleporting; a match triggers a one-shot celebratory overlay. Respect `prefers-reduced-motion` — disable the radar sweep and tweens, keep the state changes.

## Encounter & match UX

- Wave is optimistic: flip the card state locally, roll back with a toast on failure.
- Mutual wave → full-screen match sheet naming the shared attributes and offering "Say hi" (opens chat) or "Later".
- A declined user disappears silently and permanently from the list; never surface "X declined you".
- Safety affordances are always one tap away in the profile sheet and chat header: Block, Report, and "Meet in public" guidance. Include a short safety-tips screen in onboarding, linked from every match sheet.
- Notifications: request push permission only after the first mutual match, never during onboarding.

## Accessibility & performance

- The nearby list is the accessible surface: every avatar on the map has a corresponding list row with `aria-label` like "Jamie, 25 to 50 metres away, shares Acme Corp and 5-a-side football, match 78". Map canvas gets `aria-hidden="true"`.
- Contrast: proximity rings and score strokes must pass 3:1 against both map themes; verify on the satellite/dark styles too. Never encode match strength by hue alone — pair with thickness and the chip.
- Keep the marker layer under 200 features; render via a single MapLibre symbol/circle layer with data-driven styling rather than 200 React DOM markers.
- Target: first meaningful map paint < 2.5 s on a mid-tier Android over 4G; avatar images served at 2× the rendered size, lazy, with a skeleton (`animate-pulse` on a Tailwind-styled placeholder).
- Test with mocked geolocation (Playwright `context.setGeolocation`) covering: permission denied, low accuracy, zero nearby users, 200 nearby users, socket drop and recovery, and crossing from 99 m to 101 m so the user leaves the ring.
