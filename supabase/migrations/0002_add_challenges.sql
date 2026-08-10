-- Coding challenges: auto-graded exercises tied to a phase, solved and
-- tested in-browser via Pyodide (see /challenges).
--
-- test_code is Python that runs after the learner's submitted code in the
-- same interpreter globals. Convention: it prints one PASS:/FAIL: line per
-- case and a final "<passed>/<total> tests passed" summary line, which the
-- UI parses to auto-update `status` without a separate save step.

create table if not exists challenges (
  id uuid primary key default gen_random_uuid(),
  phase_id uuid references phases(id) on delete cascade,
  order_index int not null default 0,
  title text not null,
  difficulty text not null default 'easy' check (difficulty in ('easy', 'medium', 'hard')),
  prompt text not null,
  hint text,
  starter_code text not null,
  test_code text not null,
  status text default 'not_started' check (status in ('not_started', 'in_progress', 'done')),
  code_snapshot text
);

create index if not exists challenges_phase_id_idx on challenges(phase_id);

alter table challenges enable row level security;

create policy "Authenticated users can do anything with challenges"
  on challenges for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');
