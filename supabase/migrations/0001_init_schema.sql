-- Python Mastery Tracker: core schema
-- Single-user app: RLS just requires an authenticated session, no per-row ownership.

create table if not exists phases (
  id uuid primary key default gen_random_uuid(),
  order_index int not null,
  title text not null,
  summary text,
  is_spine_track boolean default false
);

create table if not exists concepts (
  id uuid primary key default gen_random_uuid(),
  phase_id uuid references phases(id) on delete cascade,
  title text not null,
  notes text,
  status text default 'not_started' check (status in ('not_started', 'in_progress', 'done'))
);

create table if not exists projects (
  id uuid primary key default gen_random_uuid(),
  phase_id uuid references phases(id) on delete cascade,
  title text not null,
  description text,
  project_type text not null check (project_type in ('mini', 'spine')),
  status text default 'not_started' check (status in ('not_started', 'in_progress', 'done')),
  code_snapshot text,
  notes text
);

create table if not exists flashcards (
  id uuid primary key default gen_random_uuid(),
  phase_id uuid references phases(id) on delete cascade,
  question text not null,
  answer text not null,
  ease_factor float default 2.5,
  interval_days int default 1,
  next_review_at timestamptz default now(),
  last_reviewed_at timestamptz
);

create table if not exists journal_entries (
  id uuid primary key default gen_random_uuid(),
  phase_id uuid references phases(id) on delete cascade,
  content text not null,
  created_at timestamptz default now()
);

create index if not exists concepts_phase_id_idx on concepts(phase_id);
create index if not exists projects_phase_id_idx on projects(phase_id);
create index if not exists flashcards_phase_id_idx on flashcards(phase_id);
create index if not exists flashcards_next_review_at_idx on flashcards(next_review_at);
create index if not exists journal_entries_phase_id_idx on journal_entries(phase_id);
create index if not exists journal_entries_created_at_idx on journal_entries(created_at desc);

alter table phases enable row level security;
alter table concepts enable row level security;
alter table projects enable row level security;
alter table flashcards enable row level security;
alter table journal_entries enable row level security;

create policy "Authenticated users can do anything with phases"
  on phases for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

create policy "Authenticated users can do anything with concepts"
  on concepts for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

create policy "Authenticated users can do anything with projects"
  on projects for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

create policy "Authenticated users can do anything with flashcards"
  on flashcards for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

create policy "Authenticated users can do anything with journal_entries"
  on journal_entries for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');
