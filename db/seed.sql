-- GENERATED FILE - run `npm run seed` to regenerate. Do not edit by hand.
-- SEED/DEMO DATA - entirely fictional people generated for local testing. Do not treat as real personal data.
-- Every INSERT is an idempotent upsert, so re-running this file resets the
-- demo rows without touching any other data.
BEGIN;

INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', 'demo_viewer', 'Demo Viewer', '🧭', 'Seed account used as the map centre', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('7fd8957d-1bde-379c-de65-161a40d422e7', 'ada_kestrel', 'Ada Kestrel', '🦅', 'Logistics analyst, permanently hungry', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('7120e0a3-483e-66f4-a9e4-b3b5d58ef4ac', 'bruno_maple', 'Bruno Maple', '🍁', 'Ops rota wrangler', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('c7d9d558-4be7-c861-1ae3-2781f4b1bdc7', 'cleo_ravensworth', 'Cleo Ravensworth', '🎧', 'Sound engineer, crate digger', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('3bc2940d-9848-f22e-86c3-a677ac53b83f', 'dev_pillar', 'Dev Pillar', '🧱', 'Bricklayer turned site planner', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('ff46015f-5bb8-d3d8-4548-99a0cc56e24c', 'elin_frost', 'Elin Frost', '❄️', 'Cold-chain scheduler', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('ddeb2edd-2579-2bb2-10de-bc0fe696fc4e', 'ferris_gale', 'Ferris Gale', '🌬️', 'Wind turbine technician', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('dadfdb1b-805b-fa8e-7e61-a9353fd32a58', 'greta_lomond', 'Greta Lomond', '🏔️', 'Climbing coach', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('6975fc26-3245-c42b-2f4d-0211b364d8dc', 'hari_dune', 'Hari Dune', '🏜️', 'Desert ultra hobbyist', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('9d4a3cc3-2825-644b-72f5-632e91d96567', 'ines_carrow', 'Ines Carrow', '📐', 'Structural engineer', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('85f14ac0-81f0-c2ca-cd83-f9ab9f13babe', 'jonas_wren', 'Jonas Wren', '🐦', 'Birdwatcher and barista', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('dd062ed6-19cc-24a2-b3ec-1f8dbcac4c5d', 'kaia_solent', 'Kaia Solent', '⛵', 'Dinghy instructor', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('63b11242-3a1b-8d62-d80d-d7f3b7a2d883', 'liam_ostrich', 'Liam Ostrich', '🥚', 'Brunch obsessive', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('4289ca4d-f4ed-a9a7-4ded-3168a0dea72e', 'mira_halcyon', 'Mira Halcyon', '🕊️', 'Yoga teacher', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('95026572-256d-faed-66cd-6455b83f80a4', 'nils_barrow', 'Nils Barrow', '🛞', 'Cargo bike courier', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('46a46574-6b29-e86b-e7b6-113768c45108', 'orla_pennyfar', 'Orla Pennyfar', '🎪', 'Festival logistics', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('37f48337-8e83-0cd9-4b5d-32f528014ec1', 'pav_esker', 'Pav Esker', '📡', 'Indoors with a terrible fix', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('8f592a36-465c-dd67-2203-d029576393f3', 'quinn_stellar', 'Quinn Stellar', '🛰️', 'Basement office, no sky view', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('d5dbb606-bb16-011b-2a50-e31cc7508103', 'rune_tallow', 'Rune Tallow', '🕯️', 'Candlemaker', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('eedb7b52-5447-462e-d250-d7022bd18d16', 'sena_orrery', 'Sena Orrery', '🔭', 'Planetarium guide', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('3249fdda-849c-a9ae-a83a-44a9f548dff3', 'tomas_vane', 'Tomas Vane', '🌀', 'Weather nerd', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('d5a3d875-8e85-48bb-aeac-c0db125a3ef9', 'ula_brightwater', 'Ula Brightwater', '💧', 'Left her phone on a bench', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('b4be0af8-00e3-7441-6a0d-f9a908cabe7f', 'vic_hollows', 'Vic Hollows', '🚪', 'Discoverability switched off', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('b60b3052-743e-4999-1024-447dad270720', 'wren_castellan', 'Wren Castellan', '👻', 'In ghost mode for an hour', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('c2adcb96-8d7e-4754-4fff-6ce2edffcb09', 'xan_petrel', 'Xan Petrel', '🚫', 'Blocked the viewer', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('e84427b0-b0c0-d501-491d-f97bfb3ec13a', 'yara_quill', 'Yara Quill', '🖋️', 'Private about her employer', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('93eb570f-a68d-90d7-eb13-510e55c23d04', 'zeb_marlow', 'Zeb Marlow', '🎲', 'Runs a dice cafe', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('2810428f-c7fd-19e3-bf2d-c757bda3b9a5', 'aster_moraine', 'Aster Moraine', '🧊', 'Glaciologist, shares nothing', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('15479582-004f-0a84-106e-295cc5c763da', 'basil_quorn', 'Basil Quorn', '🥬', 'Allotment evangelist', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('f8630544-a421-7571-8c5a-cf5f89fb6df4', 'clover_ashdown', 'Clover Ashdown', '🍀', 'Only shares one common interest', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('ca493ce7-172f-d72c-f0f0-f6fe728c203d', 'fen_arbour', 'Fen Arbour', '🌳', 'Urban forester', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('c3f705b4-732d-bb33-29eb-dcdf568ac964', 'gio_saffron', 'Gio Saffron', '🍲', 'Street food stall owner', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('534c9efc-16e4-a860-a93d-ea143611d07f', 'hollis_penrose', 'Hollis Penrose', '🧩', 'Puzzle designer', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('cbc18f44-82af-7619-59f9-b3d87fa99e1a', 'ivo_marchetti', 'Ivo Marchetti', '☕', 'Roastery apprentice', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('92342111-8110-e2a3-81b0-f430aa13557c', 'juno_pike', 'Juno Pike', '🎣', 'River guide', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('bb165441-3d49-93d8-2d07-93d474db8e8f', 'kit_ferrous', 'Kit Ferrous', '🔧', 'Bike mechanic', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('cf182a87-002a-fc25-9a09-57c724880f42', 'lore_ashby', 'Lore Ashby', '📚', 'Archivist', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('5ae9e188-ea5e-5c1d-e824-e0759f342a93', 'mose_kilburn', 'Mose Kilburn', '🥁', 'Session drummer', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('870fd555-4dfc-1d4b-9f9f-82d1e536960d', 'nadia_orpheus', 'Nadia Orpheus', '🎭', 'Stage manager', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('6af87534-ab36-5681-557a-07719ebfa621', 'ozzy_flint', 'Ozzy Flint', '🔥', 'Blacksmith', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('54865797-0493-284d-0f83-95baffba1751', 'peri_solstice', 'Peri Solstice', '🌞', 'Solar installer', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('d8f1a5fe-52f3-7418-df51-7ea4a7d14ac6', 'rafi_underwood', 'Rafi Underwood', '🌲', 'Carpenter', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('3ca5dee5-1155-effd-36b0-f4910b7d9270', 'suri_calder', 'Suri Calder', '🚉', 'On the platform, one street over', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('8595e9c0-fd2d-fb41-8678-aced2c9f513e', 'thane_gable', 'Thane Gable', '🏗️', 'Crane operator', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('8195cfa4-4639-578c-2ebb-48fce53e9f13', 'uma_veldt', 'Uma Veldt', '🦓', 'Zoologist', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('b9eba653-a744-661b-877f-e5655951a4e7', 'vero_lindqvist', 'Vero Lindqvist', '🚋', 'Tram driver', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('860caae4-6a53-caf6-22cf-e1292303e448', 'wilder_krane', 'Wilder Krane', '✈️', 'Cabin crew, different city', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('77f27a7a-1ee3-d38f-d733-e89d81366d53', 'xiu_meridian', 'Xiu Meridian', '🗺️', 'Antimeridian west side', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('6fadbc6a-8885-4a92-3e82-1389835ec4b4', 'yusuf_dateline', 'Yusuf Dateline', '🧮', 'Antimeridian east side', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;
INSERT INTO users (id, handle, display_name, avatar_emoji, headline, is_seed_data) VALUES ('e06fc06d-0435-0240-6828-83547ee2e6d9', 'zola_polaris', 'Zola Polaris', '🧊', 'High-latitude research post', TRUE)
ON CONFLICT (id) DO UPDATE SET handle = EXCLUDED.handle, display_name = EXCLUDED.display_name,
  avatar_emoji = EXCLUDED.avatar_emoji, headline = EXCLUDED.headline, is_seed_data = TRUE;

INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'nimbus-freight', 'Nimbus Freight') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('sport', 'five-a-side', 'Five-a-side football') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('sport', 'bouldering', 'Bouldering') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'board-games', 'Board games') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'street-food', 'Street food') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'vinyl-records', 'Vinyl records') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('school', 'thameside-poly', 'Thameside Polytechnic') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('language', 'portuguese', 'Portuguese') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('goal', 'find-running-buddy', 'Find a running buddy') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'harbourline-audio', 'Harbourline Audio') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'quayside-build', 'Quayside Build') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'sea-swimming', 'Sea swimming') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'orbit-energy', 'Orbit Energy') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'summit-collective', 'Summit Collective') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('goal', 'find-training-partner', 'Find a training partner') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('sport', 'trail-running', 'Trail running') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'birdwatching', 'Birdwatching') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('sport', 'sailing', 'Sailing') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('sport', 'cycling', 'Cycling') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'crafts', 'Crafts') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'astronomy', 'Astronomy') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'polar-survey', 'Polar Survey') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('sport', 'curling', 'Curling') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'ice-cores', 'Ice cores') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'green-verge', 'Green Verge') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'gardening', 'Gardening') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('language', 'welsh', 'Welsh') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'lantern-legal', 'Lantern Legal') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'saffron-street', 'Saffron Street') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'penrose-puzzles', 'Penrose Puzzles') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'coffee', 'Speciality coffee') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'riverbend-tours', 'Riverbend Tours') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('sport', 'kayaking', 'Kayaking') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'ferrous-cycles', 'Ferrous Cycles') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'thameside-archive', 'Thameside Archive') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'orpheus-stage', 'Orpheus Stage') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'theatre', 'Theatre') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'flint-forge', 'Flint Forge') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'veldt-research', 'Veldt Research') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('interest', 'wildlife', 'Wildlife') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;
INSERT INTO attribute_defs (kind, slug, label) VALUES ('company', 'meridian-charts', 'Meridian Charts') ON CONFLICT (kind, slug) DO UPDATE SET label = EXCLUDED.label;

INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'vinyl-records'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', id, 1, 'public'
FROM attribute_defs WHERE kind = 'language' AND slug = 'portuguese'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', id, 1, 'public'
FROM attribute_defs WHERE kind = 'goal' AND slug = 'find-running-buddy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '7fd8957d-1bde-379c-de65-161a40d422e7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '7fd8957d-1bde-379c-de65-161a40d422e7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '7fd8957d-1bde-379c-de65-161a40d422e7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '7fd8957d-1bde-379c-de65-161a40d422e7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'goal' AND slug = 'find-running-buddy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '7120e0a3-483e-66f4-a9e4-b3b5d58ef4ac', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '7120e0a3-483e-66f4-a9e4-b3b5d58ef4ac', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '7120e0a3-483e-66f4-a9e4-b3b5d58ef4ac', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'vinyl-records'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '7120e0a3-483e-66f4-a9e4-b3b5d58ef4ac', id, 1, 'public'
FROM attribute_defs WHERE kind = 'language' AND slug = 'portuguese'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c7d9d558-4be7-c861-1ae3-2781f4b1bdc7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'harbourline-audio'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c7d9d558-4be7-c861-1ae3-2781f4b1bdc7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'vinyl-records'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c7d9d558-4be7-c861-1ae3-2781f4b1bdc7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c7d9d558-4be7-c861-1ae3-2781f4b1bdc7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '3bc2940d-9848-f22e-86c3-a677ac53b83f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'quayside-build'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '3bc2940d-9848-f22e-86c3-a677ac53b83f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '3bc2940d-9848-f22e-86c3-a677ac53b83f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'goal' AND slug = 'find-running-buddy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'ff46015f-5bb8-d3d8-4548-99a0cc56e24c', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'ff46015f-5bb8-d3d8-4548-99a0cc56e24c', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'sea-swimming'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'ddeb2edd-2579-2bb2-10de-bc0fe696fc4e', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'orbit-energy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'ddeb2edd-2579-2bb2-10de-bc0fe696fc4e', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'ddeb2edd-2579-2bb2-10de-bc0fe696fc4e', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'dadfdb1b-805b-fa8e-7e61-a9353fd32a58', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'summit-collective'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'dadfdb1b-805b-fa8e-7e61-a9353fd32a58', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'dadfdb1b-805b-fa8e-7e61-a9353fd32a58', id, 1, 'public'
FROM attribute_defs WHERE kind = 'goal' AND slug = 'find-training-partner'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '6975fc26-3245-c42b-2f4d-0211b364d8dc', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'trail-running'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '6975fc26-3245-c42b-2f4d-0211b364d8dc', id, 1, 'public'
FROM attribute_defs WHERE kind = 'goal' AND slug = 'find-running-buddy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '6975fc26-3245-c42b-2f4d-0211b364d8dc', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '9d4a3cc3-2825-644b-72f5-632e91d96567', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '9d4a3cc3-2825-644b-72f5-632e91d96567', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '9d4a3cc3-2825-644b-72f5-632e91d96567', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '85f14ac0-81f0-c2ca-cd83-f9ab9f13babe', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'birdwatching'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '85f14ac0-81f0-c2ca-cd83-f9ab9f13babe', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '85f14ac0-81f0-c2ca-cd83-f9ab9f13babe', id, 1, 'public'
FROM attribute_defs WHERE kind = 'language' AND slug = 'portuguese'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'dd062ed6-19cc-24a2-b3ec-1f8dbcac4c5d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'sailing'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'dd062ed6-19cc-24a2-b3ec-1f8dbcac4c5d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'dd062ed6-19cc-24a2-b3ec-1f8dbcac4c5d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'vinyl-records'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '63b11242-3a1b-8d62-d80d-d7f3b7a2d883', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '63b11242-3a1b-8d62-d80d-d7f3b7a2d883', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '63b11242-3a1b-8d62-d80d-d7f3b7a2d883', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '4289ca4d-f4ed-a9a7-4ded-3168a0dea72e', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '4289ca4d-f4ed-a9a7-4ded-3168a0dea72e', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '4289ca4d-f4ed-a9a7-4ded-3168a0dea72e', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '4289ca4d-f4ed-a9a7-4ded-3168a0dea72e', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '95026572-256d-faed-66cd-6455b83f80a4', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '95026572-256d-faed-66cd-6455b83f80a4', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'cycling'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '95026572-256d-faed-66cd-6455b83f80a4', id, 1, 'public'
FROM attribute_defs WHERE kind = 'goal' AND slug = 'find-running-buddy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '46a46574-6b29-e86b-e7b6-113768c45108', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '46a46574-6b29-e86b-e7b6-113768c45108', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '37f48337-8e83-0cd9-4b5d-32f528014ec1', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '37f48337-8e83-0cd9-4b5d-32f528014ec1', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '8f592a36-465c-dd67-2203-d029576393f3', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '8f592a36-465c-dd67-2203-d029576393f3', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '8f592a36-465c-dd67-2203-d029576393f3', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'd5dbb606-bb16-011b-2a50-e31cc7508103', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'crafts'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'd5dbb606-bb16-011b-2a50-e31cc7508103', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'eedb7b52-5447-462e-d250-d7022bd18d16', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'eedb7b52-5447-462e-d250-d7022bd18d16', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'astronomy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'eedb7b52-5447-462e-d250-d7022bd18d16', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '3249fdda-849c-a9ae-a83a-44a9f548dff3', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '3249fdda-849c-a9ae-a83a-44a9f548dff3', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '3249fdda-849c-a9ae-a83a-44a9f548dff3', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'd5a3d875-8e85-48bb-aeac-c0db125a3ef9', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'd5a3d875-8e85-48bb-aeac-c0db125a3ef9', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'd5a3d875-8e85-48bb-aeac-c0db125a3ef9', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'b4be0af8-00e3-7441-6a0d-f9a908cabe7f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'b4be0af8-00e3-7441-6a0d-f9a908cabe7f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'b4be0af8-00e3-7441-6a0d-f9a908cabe7f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'b60b3052-743e-4999-1024-447dad270720', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'b60b3052-743e-4999-1024-447dad270720', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'vinyl-records'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c2adcb96-8d7e-4754-4fff-6ce2edffcb09', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c2adcb96-8d7e-4754-4fff-6ce2edffcb09', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'e84427b0-b0c0-d501-491d-f97bfb3ec13a', id, 1, 'private'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'e84427b0-b0c0-d501-491d-f97bfb3ec13a', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'e84427b0-b0c0-d501-491d-f97bfb3ec13a', id, 1, 'matches'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '93eb570f-a68d-90d7-eb13-510e55c23d04', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '93eb570f-a68d-90d7-eb13-510e55c23d04', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '93eb570f-a68d-90d7-eb13-510e55c23d04', id, 1, 'matches'
FROM attribute_defs WHERE kind = 'language' AND slug = 'portuguese'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '2810428f-c7fd-19e3-bf2d-c757bda3b9a5', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'polar-survey'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '2810428f-c7fd-19e3-bf2d-c757bda3b9a5', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'curling'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '2810428f-c7fd-19e3-bf2d-c757bda3b9a5', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'ice-cores'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '15479582-004f-0a84-106e-295cc5c763da', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'green-verge'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '15479582-004f-0a84-106e-295cc5c763da', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'gardening'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '15479582-004f-0a84-106e-295cc5c763da', id, 1, 'public'
FROM attribute_defs WHERE kind = 'language' AND slug = 'welsh'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'f8630544-a421-7571-8c5a-cf5f89fb6df4', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'lantern-legal'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'f8630544-a421-7571-8c5a-cf5f89fb6df4', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'ca493ce7-172f-d72c-f0f0-f6fe728c203d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'green-verge'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'ca493ce7-172f-d72c-f0f0-f6fe728c203d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'trail-running'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'ca493ce7-172f-d72c-f0f0-f6fe728c203d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'goal' AND slug = 'find-running-buddy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'ca493ce7-172f-d72c-f0f0-f6fe728c203d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c3f705b4-732d-bb33-29eb-dcdf568ac964', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'saffron-street'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c3f705b4-732d-bb33-29eb-dcdf568ac964', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'street-food'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c3f705b4-732d-bb33-29eb-dcdf568ac964', id, 1, 'public'
FROM attribute_defs WHERE kind = 'language' AND slug = 'portuguese'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'c3f705b4-732d-bb33-29eb-dcdf568ac964', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '534c9efc-16e4-a860-a93d-ea143611d07f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'penrose-puzzles'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '534c9efc-16e4-a860-a93d-ea143611d07f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '534c9efc-16e4-a860-a93d-ea143611d07f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'cbc18f44-82af-7619-59f9-b3d87fa99e1a', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'cbc18f44-82af-7619-59f9-b3d87fa99e1a', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'coffee'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'cbc18f44-82af-7619-59f9-b3d87fa99e1a', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '92342111-8110-e2a3-81b0-f430aa13557c', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'riverbend-tours'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '92342111-8110-e2a3-81b0-f430aa13557c', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'kayaking'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '92342111-8110-e2a3-81b0-f430aa13557c', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'birdwatching'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'bb165441-3d49-93d8-2d07-93d474db8e8f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'ferrous-cycles'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'bb165441-3d49-93d8-2d07-93d474db8e8f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'cycling'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'bb165441-3d49-93d8-2d07-93d474db8e8f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'bb165441-3d49-93d8-2d07-93d474db8e8f', id, 1, 'public'
FROM attribute_defs WHERE kind = 'goal' AND slug = 'find-training-partner'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'cf182a87-002a-fc25-9a09-57c724880f42', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'thameside-archive'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'cf182a87-002a-fc25-9a09-57c724880f42', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'cf182a87-002a-fc25-9a09-57c724880f42', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'vinyl-records'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'cf182a87-002a-fc25-9a09-57c724880f42', id, 1, 'public'
FROM attribute_defs WHERE kind = 'language' AND slug = 'portuguese'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '5ae9e188-ea5e-5c1d-e824-e0759f342a93', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'harbourline-audio'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '5ae9e188-ea5e-5c1d-e824-e0759f342a93', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'vinyl-records'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '5ae9e188-ea5e-5c1d-e824-e0759f342a93', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '870fd555-4dfc-1d4b-9f9f-82d1e536960d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'orpheus-stage'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '870fd555-4dfc-1d4b-9f9f-82d1e536960d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'theatre'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '870fd555-4dfc-1d4b-9f9f-82d1e536960d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '870fd555-4dfc-1d4b-9f9f-82d1e536960d', id, 1, 'public'
FROM attribute_defs WHERE kind = 'language' AND slug = 'portuguese'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '6af87534-ab36-5681-557a-07719ebfa621', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'flint-forge'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '6af87534-ab36-5681-557a-07719ebfa621', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '6af87534-ab36-5681-557a-07719ebfa621', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'crafts'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '54865797-0493-284d-0f83-95baffba1751', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'orbit-energy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '54865797-0493-284d-0f83-95baffba1751', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '54865797-0493-284d-0f83-95baffba1751', id, 1, 'public'
FROM attribute_defs WHERE kind = 'goal' AND slug = 'find-running-buddy'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'd8f1a5fe-52f3-7418-df51-7ea4a7d14ac6', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'quayside-build'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'd8f1a5fe-52f3-7418-df51-7ea4a7d14ac6', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'crafts'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'd8f1a5fe-52f3-7418-df51-7ea4a7d14ac6', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '3ca5dee5-1155-effd-36b0-f4910b7d9270', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '3ca5dee5-1155-effd-36b0-f4910b7d9270', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '3ca5dee5-1155-effd-36b0-f4910b7d9270', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '8595e9c0-fd2d-fb41-8678-aced2c9f513e', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'quayside-build'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '8595e9c0-fd2d-fb41-8678-aced2c9f513e', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '8195cfa4-4639-578c-2ebb-48fce53e9f13', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'veldt-research'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '8195cfa4-4639-578c-2ebb-48fce53e9f13', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'wildlife'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '8195cfa4-4639-578c-2ebb-48fce53e9f13', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'b9eba653-a744-661b-877f-e5655951a4e7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'b9eba653-a744-661b-877f-e5655951a4e7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'vinyl-records'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'b9eba653-a744-661b-877f-e5655951a4e7', id, 1, 'public'
FROM attribute_defs WHERE kind = 'language' AND slug = 'portuguese'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '860caae4-6a53-caf6-22cf-e1292303e448', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'nimbus-freight'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '860caae4-6a53-caf6-22cf-e1292303e448', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'five-a-side'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '860caae4-6a53-caf6-22cf-e1292303e448', id, 1, 'public'
FROM attribute_defs WHERE kind = 'school' AND slug = 'thameside-poly'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '77f27a7a-1ee3-d38f-d733-e89d81366d53', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'meridian-charts'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '77f27a7a-1ee3-d38f-d733-e89d81366d53', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '6fadbc6a-8885-4a92-3e82-1389835ec4b4', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'meridian-charts'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT '6fadbc6a-8885-4a92-3e82-1389835ec4b4', id, 1, 'public'
FROM attribute_defs WHERE kind = 'interest' AND slug = 'board-games'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'e06fc06d-0435-0240-6828-83547ee2e6d9', id, 1, 'public'
FROM attribute_defs WHERE kind = 'company' AND slug = 'polar-survey'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;
INSERT INTO user_attributes (user_id, attribute_id, weight, visibility)
SELECT 'e06fc06d-0435-0240-6828-83547ee2e6d9', id, 1, 'public'
FROM attribute_defs WHERE kind = 'sport' AND slug = 'bouldering'
ON CONFLICT (user_id, attribute_id) DO UPDATE SET weight = EXCLUDED.weight, visibility = EXCLUDED.visibility;

INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', ST_SetSRID(ST_MakePoint(-0.0166, 51.5386), 4326)::geography,
  8, TRUE, NULL, now() - interval '3 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('7fd8957d-1bde-379c-de65-161a40d422e7', ST_SetSRID(ST_MakePoint(-0.016582, 51.5386528), 4326)::geography,
  6, TRUE, NULL, now() - interval '4 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('7120e0a3-483e-66f4-a9e4-b3b5d58ef4ac', ST_SetSRID(ST_MakePoint(-0.016402, 51.5386262), 4326)::geography,
  9, TRUE, NULL, now() - interval '11 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('c7d9d558-4be7-c861-1ae3-2781f4b1bdc7', ST_SetSRID(ST_MakePoint(-0.0164258, 51.5384453), 4326)::geography,
  7, TRUE, NULL, now() - interval '6 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('3bc2940d-9848-f22e-86c3-a677ac53b83f', ST_SetSRID(ST_MakePoint(-0.0167264, 51.5383951), 4326)::geography,
  5, TRUE, NULL, now() - interval '8 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('ff46015f-5bb8-d3d8-4548-99a0cc56e24c', ST_SetSRID(ST_MakePoint(-0.016956, 51.538561), 4326)::geography,
  6, TRUE, NULL, now() - interval '9 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('ddeb2edd-2579-2bb2-10de-bc0fe696fc4e', ST_SetSRID(ST_MakePoint(-0.0162094, 51.5389741), 4326)::geography,
  11, TRUE, NULL, now() - interval '15 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('dadfdb1b-805b-fa8e-7e61-a9353fd32a58', ST_SetSRID(ST_MakePoint(-0.015881, 51.538553), 4326)::geography,
  8, TRUE, NULL, now() - interval '12 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('6975fc26-3245-c42b-2f4d-0211b364d8dc', ST_SetSRID(ST_MakePoint(-0.016486, 51.5381523), 4326)::geography,
  10, TRUE, NULL, now() - interval '20 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('9d4a3cc3-2825-644b-72f5-632e91d96567', ST_SetSRID(ST_MakePoint(-0.0164028, 51.5394728), 4326)::geography,
  6, TRUE, NULL, now() - interval '7 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('85f14ac0-81f0-c2ca-cd83-f9ab9f13babe', ST_SetSRID(ST_MakePoint(-0.0153134, 51.5389903), 4326)::geography,
  9, TRUE, NULL, now() - interval '18 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('dd062ed6-19cc-24a2-b3ec-1f8dbcac4c5d', ST_SetSRID(ST_MakePoint(-0.0153367, 51.5381644), 4326)::geography,
  7, TRUE, NULL, now() - interval '22 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('63b11242-3a1b-8d62-d80d-d7f3b7a2d883', ST_SetSRID(ST_MakePoint(-0.0167762, 51.5377074), 4326)::geography,
  5, TRUE, NULL, now() - interval '10 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('4289ca4d-f4ed-a9a7-4ded-3168a0dea72e', ST_SetSRID(ST_MakePoint(-0.0177462, 51.538043), 4326)::geography,
  5, TRUE, NULL, now() - interval '9 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('95026572-256d-faed-66cd-6455b83f80a4', ST_SetSRID(ST_MakePoint(-0.0179808, 51.5388957), 4326)::geography,
  8, TRUE, NULL, now() - interval '14 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('46a46574-6b29-e86b-e7b6-113768c45108', ST_SetSRID(ST_MakePoint(-0.0171539, 51.5395465), 4326)::geography,
  12, TRUE, NULL, now() - interval '25 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('37f48337-8e83-0cd9-4b5d-32f528014ec1', ST_SetSRID(ST_MakePoint(-0.0161262, 51.5388063), 4326)::geography,
  148, TRUE, NULL, now() - interval '30 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('8f592a36-465c-dd67-2203-d029576393f3', ST_SetSRID(ST_MakePoint(-0.0169757, 51.5387349), 4326)::geography,
  220, TRUE, NULL, now() - interval '35 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('d5dbb606-bb16-011b-2a50-e31cc7508103', ST_SetSRID(ST_MakePoint(-0.0162707, 51.5393644), 4326)::geography,
  40, TRUE, NULL, now() - interval '45 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('eedb7b52-5447-462e-d250-d7022bd18d16', ST_SetSRID(ST_MakePoint(-0.0169253, 51.5382495), 4326)::geography,
  10, TRUE, NULL, now() - interval '61 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('3249fdda-849c-a9ae-a83a-44a9f548dff3', ST_SetSRID(ST_MakePoint(-0.0173513, 51.5383302), 4326)::geography,
  9, TRUE, NULL, now() - interval '299 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('d5a3d875-8e85-48bb-aeac-c0db125a3ef9', ST_SetSRID(ST_MakePoint(-0.0162123, 51.5383977), 4326)::geography,
  8, TRUE, NULL, now() - interval '420 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('b4be0af8-00e3-7441-6a0d-f9a908cabe7f', ST_SetSRID(ST_MakePoint(-0.0164291, 51.5386187), 4326)::geography,
  6, FALSE, NULL, now() - interval '5 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('b60b3052-743e-4999-1024-447dad270720', ST_SetSRID(ST_MakePoint(-0.0166452, 51.5387594), 4326)::geography,
  7, TRUE, now() + interval '1 hour', now() - interval '6 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('c2adcb96-8d7e-4754-4fff-6ce2edffcb09', ST_SetSRID(ST_MakePoint(-0.0165096, 51.5386582), 4326)::geography,
  5, TRUE, NULL, now() - interval '4 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('e84427b0-b0c0-d501-491d-f97bfb3ec13a', ST_SetSRID(ST_MakePoint(-0.0164267, 51.5388668), 4326)::geography,
  8, TRUE, NULL, now() - interval '12 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('93eb570f-a68d-90d7-eb13-510e55c23d04', ST_SetSRID(ST_MakePoint(-0.0170856, 51.5388115), 4326)::geography,
  9, TRUE, NULL, now() - interval '16 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('2810428f-c7fd-19e3-bf2d-c757bda3b9a5', ST_SetSRID(ST_MakePoint(-0.0163864, 51.5385766), 4326)::geography,
  6, TRUE, NULL, now() - interval '8 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('15479582-004f-0a84-106e-295cc5c763da', ST_SetSRID(ST_MakePoint(-0.0166678, 51.5383609), 4326)::geography,
  7, TRUE, NULL, now() - interval '13 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('f8630544-a421-7571-8c5a-cf5f89fb6df4', ST_SetSRID(ST_MakePoint(-0.0162439, 51.5392085), 4326)::geography,
  10, TRUE, NULL, now() - interval '24 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('ca493ce7-172f-d72c-f0f0-f6fe728c203d', ST_SetSRID(ST_MakePoint(-0.0175074, 51.5386494), 4326)::geography,
  8, TRUE, NULL, now() - interval '19 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('c3f705b4-732d-bb33-29eb-dcdf568ac964', ST_SetSRID(ST_MakePoint(-0.0155549, 51.5383888), 4326)::geography,
  12, TRUE, NULL, now() - interval '27 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('534c9efc-16e4-a860-a93d-ea143611d07f', ST_SetSRID(ST_MakePoint(-0.0169954, 51.5378857), 4326)::geography,
  10, TRUE, NULL, now() - interval '23 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('cbc18f44-82af-7619-59f9-b3d87fa99e1a', ST_SetSRID(ST_MakePoint(-0.017232, 51.5390685), 4326)::geography,
  9, TRUE, NULL, now() - interval '26 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('92342111-8110-e2a3-81b0-f430aa13557c', ST_SetSRID(ST_MakePoint(-0.0178364, 51.5383201), 4326)::geography,
  13, TRUE, NULL, now() - interval '31 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('bb165441-3d49-93d8-2d07-93d474db8e8f', ST_SetSRID(ST_MakePoint(-0.0164587, 51.5390134), 4326)::geography,
  7, TRUE, NULL, now() - interval '14 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('cf182a87-002a-fc25-9a09-57c724880f42', ST_SetSRID(ST_MakePoint(-0.0158341, 51.5386166), 4326)::geography,
  8, TRUE, NULL, now() - interval '18 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('5ae9e188-ea5e-5c1d-e824-e0759f342a93', ST_SetSRID(ST_MakePoint(-0.0165128, 51.5383449), 4326)::geography,
  6, TRUE, NULL, now() - interval '10 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('870fd555-4dfc-1d4b-9f9f-82d1e536960d', ST_SetSRID(ST_MakePoint(-0.0158658, 51.5391442), 4326)::geography,
  10, TRUE, NULL, now() - interval '29 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('6af87534-ab36-5681-557a-07719ebfa621', ST_SetSRID(ST_MakePoint(-0.015529, 51.5380795), 4326)::geography,
  12, TRUE, NULL, now() - interval '33 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('54865797-0493-284d-0f83-95baffba1751', ST_SetSRID(ST_MakePoint(-0.0172134, 51.5381453), 4326)::geography,
  9, TRUE, NULL, now() - interval '20 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('d8f1a5fe-52f3-7418-df51-7ea4a7d14ac6', ST_SetSRID(ST_MakePoint(-0.0169169, 51.5386172), 4326)::geography,
  7, TRUE, NULL, now() - interval '11 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('3ca5dee5-1155-effd-36b0-f4910b7d9270', ST_SetSRID(ST_MakePoint(-0.014468, 51.5395285), 4326)::geography,
  9, TRUE, NULL, now() - interval '15 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('8595e9c0-fd2d-fb41-8678-aced2c9f513e', ST_SetSRID(ST_MakePoint(-0.0141837, 51.5368088), 4326)::geography,
  11, TRUE, NULL, now() - interval '22 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('8195cfa4-4639-578c-2ebb-48fce53e9f13', ST_SetSRID(ST_MakePoint(-0.0233621, 51.541028), 4326)::geography,
  14, TRUE, NULL, now() - interval '40 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('b9eba653-a744-661b-877f-e5655951a4e7', ST_SetSRID(ST_MakePoint(-0.0106644, 51.5487409), 4326)::geography,
  16, TRUE, NULL, now() - interval '50 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('860caae4-6a53-caf6-22cf-e1292303e448', ST_SetSRID(ST_MakePoint(0.1930525, 51.5733275), 4326)::geography,
  20, TRUE, NULL, now() - interval '60 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('77f27a7a-1ee3-d38f-d733-e89d81366d53', ST_SetSRID(ST_MakePoint(179.9999, -16.5), 4326)::geography,
  8, TRUE, NULL, now() - interval '12 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('6fadbc6a-8885-4a92-3e82-1389835ec4b4', ST_SetSRID(ST_MakePoint(-179.9999, -16.5), 4326)::geography,
  8, TRUE, NULL, now() - interval '12 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;
INSERT INTO user_presence (user_id, geog, accuracy_m, discoverable, ghost_until, updated_at)
VALUES ('e06fc06d-0435-0240-6828-83547ee2e6d9', ST_SetSRID(ST_MakePoint(42, 89.9), 4326)::geography,
  25, TRUE, NULL, now() - interval '90 seconds')
ON CONFLICT (user_id) DO UPDATE SET geog = EXCLUDED.geog, accuracy_m = EXCLUDED.accuracy_m,
  discoverable = EXCLUDED.discoverable, ghost_until = EXCLUDED.ghost_until, updated_at = EXCLUDED.updated_at;

-- target blocked the viewer - viewer must not see them
INSERT INTO blocks (blocker_id, blocked_id) VALUES ('c2adcb96-8d7e-4754-4fff-6ce2edffcb09', '20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae') ON CONFLICT DO NOTHING;
-- viewer blocked the target - target must not appear
INSERT INTO blocks (blocker_id, blocked_id) VALUES ('20d1db65-b2c0-fb3c-f1bc-3eaaed00d0ae', '15479582-004f-0a84-106e-295cc5c763da') ON CONFLICT DO NOTHING;

COMMIT;
