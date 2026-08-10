-- Gamification: XP, levels, streaks, and achievements are all computed live
-- from existing data (see src/lib/gamification.ts) -- no new tables needed
-- for those. The one thing we do need is a completion timestamp, since
-- `status` alone can't tell us *when* something was finished, and streaks
-- have to know which calendar days had activity.

alter table concepts add column if not exists completed_at timestamptz;
alter table projects add column if not exists completed_at timestamptz;
alter table challenges add column if not exists completed_at timestamptz;

-- Backfill: anything already marked done before this migration existed had
-- no way to record when. Stamping it "now" means today already counts as
-- an active day for the streak, instead of penalizing existing progress.
update concepts set completed_at = now() where status = 'done' and completed_at is null;
update projects set completed_at = now() where status = 'done' and completed_at is null;
update challenges set completed_at = now() where status = 'done' and completed_at is null;
