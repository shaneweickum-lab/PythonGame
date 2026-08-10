export type ReviewGrade = "again" | "hard" | "good" | "easy";

const MIN_EASE_FACTOR = 1.3;
const DAY_MS = 24 * 60 * 60 * 1000;

export function scheduleNextReview(
  current: { ease_factor: number; interval_days: number },
  grade: ReviewGrade,
  now: Date,
): { ease_factor: number; interval_days: number; next_review_at: string } {
  let { ease_factor } = current;
  let interval_days: number;

  switch (grade) {
    case "again":
      interval_days = 1;
      ease_factor = Math.max(MIN_EASE_FACTOR, ease_factor - 0.2);
      break;
    case "hard":
      interval_days = Math.max(1, Math.round(current.interval_days * 1.2));
      ease_factor = Math.max(MIN_EASE_FACTOR, ease_factor - 0.15);
      break;
    case "good":
      interval_days = Math.max(1, Math.round(current.interval_days * ease_factor));
      break;
    case "easy":
      interval_days = Math.max(
        1,
        Math.round(current.interval_days * ease_factor * 1.3),
      );
      ease_factor = ease_factor + 0.15;
      break;
  }

  const next_review_at = new Date(now.getTime() + interval_days * DAY_MS).toISOString();

  return { ease_factor, interval_days, next_review_at };
}
