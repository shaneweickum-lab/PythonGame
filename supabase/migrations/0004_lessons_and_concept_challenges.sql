-- Adds a dedicated lesson to each concept, and lets challenges target a
-- specific concept (not just a phase) so /learn/[conceptId] can show 4
-- challenges that drill exactly the concept just taught.

alter table concepts add column if not exists lesson_content text;

alter table challenges add column if not exists concept_id uuid references concepts(id) on delete cascade;

create index if not exists challenges_concept_id_idx on challenges(concept_id);
