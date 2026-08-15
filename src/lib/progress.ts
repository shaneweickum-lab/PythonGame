// Joins shared curriculum content (identical for every account) with the
// signed-in user's own progress rows into the combined shape the rest of
// the app renders (Concept/Project/Challenge/Flashcard, unchanged from
// before this table split) -- see supabase/migrations/0007_per_user_progress.sql.
import type {
  Challenge,
  ChallengeContent,
  ChallengeProgress,
  Concept,
  ConceptContent,
  ConceptProgress,
  Flashcard,
  FlashcardContent,
  FlashcardProgress,
  Project,
  ProjectContent,
  ProjectProgress,
} from "@/lib/supabase/types";

// A never-reviewed flashcard (no progress row yet) is due immediately --
// this sentinel is always <= "now" for the /review due-query.
export const NEVER_REVIEWED_AT = new Date(0).toISOString();

export function mergeConcepts(rows: ConceptContent[], progress: ConceptProgress[]): Concept[] {
  const byId = new Map(progress.map((p) => [p.concept_id, p]));
  return rows.map((r) => {
    const p = byId.get(r.id);
    return {
      ...r,
      status: p?.status ?? "not_started",
      completed_at: p?.completed_at ?? null,
    };
  });
}

export function mergeProjects(rows: ProjectContent[], progress: ProjectProgress[]): Project[] {
  const byId = new Map(progress.map((p) => [p.project_id, p]));
  return rows.map((r) => {
    const p = byId.get(r.id);
    return {
      ...r,
      status: p?.status ?? "not_started",
      code_snapshot: p?.code_snapshot ?? null,
      notes: p?.notes ?? null,
      completed_at: p?.completed_at ?? null,
    };
  });
}

export function mergeChallenges(rows: ChallengeContent[], progress: ChallengeProgress[]): Challenge[] {
  const byId = new Map(progress.map((p) => [p.challenge_id, p]));
  return rows.map((r) => {
    const p = byId.get(r.id);
    return {
      ...r,
      status: p?.status ?? "not_started",
      code_snapshot: p?.code_snapshot ?? null,
      completed_at: p?.completed_at ?? null,
    };
  });
}

export function mergeFlashcards(rows: FlashcardContent[], progress: FlashcardProgress[]): Flashcard[] {
  const byId = new Map(progress.map((p) => [p.flashcard_id, p]));
  return rows.map((r) => {
    const p = byId.get(r.id);
    return {
      ...r,
      ease_factor: p?.ease_factor ?? 2.5,
      interval_days: p?.interval_days ?? 1,
      next_review_at: p?.next_review_at ?? NEVER_REVIEWED_AT,
      last_reviewed_at: p?.last_reviewed_at ?? null,
    };
  });
}

export const CONCEPT_CONTENT_COLUMNS = "id, phase_id, order_index, title, notes, lesson_content";
export const PROJECT_CONTENT_COLUMNS =
  "id, phase_id, concept_id, title, description, project_type";
export const CHALLENGE_CONTENT_COLUMNS =
  "id, phase_id, concept_id, order_index, title, difficulty, prompt, hint, starter_code, test_code";
export const FLASHCARD_CONTENT_COLUMNS = "id, phase_id, question, answer";
