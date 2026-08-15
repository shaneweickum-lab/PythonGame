-- Splits per-user progress out of shared curriculum content.
--
-- Every table's RLS policy up to this point was "any authenticated user
-- can do anything" -- there was no user_id column anywhere. status/
-- completed_at/code_snapshot/notes/SM-2 fields lived directly on the
-- shared concepts/projects/challenges/flashcards rows, so every signed-in
-- account read and wrote the exact same progress: level, streak, badges,
-- and every status toggle were identical across accounts.
--
-- This migration is an intentional reset of all progress recorded so far
-- -- there was never a way to attribute the old shared columns' values to
-- a specific account, so there's nothing meaningful to carry forward.
--
-- The old status/completed_at/code_snapshot/notes/SM-2 columns are left in
-- place on the content tables (unused, not dropped) rather than removed --
-- a later cleanup migration can drop them once the new model has been
-- running for a while. Leaving them but making the tables read-only for
-- the `authenticated` role below means any code path that was missed
-- during this change fails loudly (an RLS permission error) instead of
-- silently writing to the old shared columns again.

-- Per-user progress tables. user_id defaults to auth.uid() so app code
-- doesn't have to look up and pass the current user's id on every insert;
-- NOT NULL is safe here since these tables start empty (no backfill).

create table if not exists concept_progress (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  concept_id uuid not null references concepts(id) on delete cascade,
  status text not null default 'not_started' check (status in ('not_started', 'in_progress', 'done')),
  completed_at timestamptz,
  primary key (user_id, concept_id)
);

create table if not exists project_progress (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  project_id uuid not null references projects(id) on delete cascade,
  status text not null default 'not_started' check (status in ('not_started', 'in_progress', 'done')),
  code_snapshot text,
  notes text,
  completed_at timestamptz,
  primary key (user_id, project_id)
);

create table if not exists challenge_progress (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  challenge_id uuid not null references challenges(id) on delete cascade,
  status text not null default 'not_started' check (status in ('not_started', 'in_progress', 'done')),
  code_snapshot text,
  completed_at timestamptz,
  primary key (user_id, challenge_id)
);

create table if not exists flashcard_progress (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  flashcard_id uuid not null references flashcards(id) on delete cascade,
  ease_factor float not null default 2.5,
  interval_days int not null default 1,
  next_review_at timestamptz not null default now(),
  last_reviewed_at timestamptz,
  primary key (user_id, flashcard_id)
);

alter table concept_progress enable row level security;
alter table project_progress enable row level security;
alter table challenge_progress enable row level security;
alter table flashcard_progress enable row level security;

create policy "Users manage their own concept progress" on concept_progress
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users manage their own project progress" on project_progress
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users manage their own challenge progress" on challenge_progress
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users manage their own flashcard progress" on flashcard_progress
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Curriculum content tables become read-only for signed-in users -- nothing
-- in the app writes to them at runtime any more (only the SQL-editor seed
-- files do, which run as the postgres role and bypass RLS regardless).
drop policy if exists "Authenticated users can do anything with concepts" on concepts;
create policy "Authenticated users can read concepts" on concepts
  for select using (auth.role() = 'authenticated');

drop policy if exists "Authenticated users can do anything with projects" on projects;
create policy "Authenticated users can read projects" on projects
  for select using (auth.role() = 'authenticated');

drop policy if exists "Authenticated users can do anything with challenges" on challenges;
create policy "Authenticated users can read challenges" on challenges
  for select using (auth.role() = 'authenticated');

drop policy if exists "Authenticated users can do anything with flashcards" on flashcards;
create policy "Authenticated users can read flashcards" on flashcards
  for select using (auth.role() = 'authenticated');

-- journal_entries and bamboo_files are already genuinely per-user content
-- (a journal entry's text, a saved sketch's code) rather than shared
-- curriculum -- they just need an owner column, not a separate progress
-- table. user_id is nullable here (unlike the progress tables above)
-- because these tables may already have existing rows on a live project;
-- auth.uid() resolves to null when this migration runs via the SQL editor
-- (no request-scoped JWT), so a NOT NULL column would fail to backfill.
-- Any pre-existing rows simply become invisible under the new RLS policy
-- (auth.uid() = user_id can never match a null user_id) rather than being
-- deleted -- reversible later with a manual UPDATE if they ever matter.
alter table journal_entries add column if not exists user_id uuid default auth.uid() references auth.users(id) on delete cascade;
alter table bamboo_files add column if not exists user_id uuid default auth.uid() references auth.users(id) on delete cascade;

drop policy if exists "Authenticated users can do anything with journal_entries" on journal_entries;
create policy "Users manage their own journal entries" on journal_entries
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "Authenticated users can do anything with bamboo_files" on bamboo_files;
create policy "Users manage their own bamboo files" on bamboo_files
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
