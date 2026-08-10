-- Links projects to a specific concept and adds a 'micro' project type for
-- small, focused exercises that reinforce one concept at a time -- separate
-- from the existing phase-level integrative 'mini' project and the running
-- 'spine' milestone.

alter table projects add column if not exists concept_id uuid references concepts(id) on delete cascade;

alter table projects drop constraint if exists projects_project_type_check;
alter table projects add constraint projects_project_type_check
  check (project_type in ('micro', 'mini', 'spine'));

create index if not exists projects_concept_id_idx on projects(concept_id);

-- Concepts had no explicit ordering (the app fell back to sorting by title,
-- which scrambles the intended teaching sequence once there are many
-- concepts per phase). order_index lets each phase's concepts render in the
-- order they should be learned.
alter table concepts add column if not exists order_index int not null default 0;
