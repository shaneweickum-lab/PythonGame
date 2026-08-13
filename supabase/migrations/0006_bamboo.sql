-- BambooScript project storage (ported from BambooGrove IDE, which used
-- localStorage). A "project" is a flat group of files sharing the same
-- `project_id` -- the entry file's own `id` doubles as its project's id,
-- exactly matching the original storage.js convention (`entry.id ===
-- entry.projectId`), just persisted server-side instead of client-only so
-- it syncs across devices like everything else in this app.

create table if not exists bamboo_files (
  id uuid primary key,
  project_id uuid not null,
  name text not null,
  content text not null default '',
  updated_at timestamptz not null default now()
);

create index if not exists bamboo_files_project_id_idx on bamboo_files(project_id);

alter table bamboo_files enable row level security;

create policy "Authenticated users can do anything with bamboo_files"
  on bamboo_files for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');
