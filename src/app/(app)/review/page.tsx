import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { ReviewSession } from "@/components/ReviewSession";
import { FLASHCARD_CONTENT_COLUMNS, mergeFlashcards } from "@/lib/progress";
import type { FlashcardContent, FlashcardProgress } from "@/lib/supabase/types";

export default async function ReviewPage() {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-6">
        <div>
          <h1 className="text-2xl font-semibold text-slate-100">Review</h1>
          <p className="mt-1 text-sm text-slate-400">
            Spaced-repetition flashcards, due cards only.
          </p>
        </div>
        <NotConfiguredNotice />
      </div>
    );
  }

  const supabase = await createClient();

  const [{ data: flashcards }, { data: flashcardProgress }] = await Promise.all([
    supabase.from("flashcards").select(FLASHCARD_CONTENT_COLUMNS),
    supabase.from("flashcard_progress").select("*"),
  ]);

  const now = new Date().toISOString();
  const dueCards = mergeFlashcards(
    (flashcards ?? []) as FlashcardContent[],
    (flashcardProgress ?? []) as FlashcardProgress[],
  )
    .filter((c) => c.next_review_at <= now)
    .sort((a, b) => a.next_review_at.localeCompare(b.next_review_at));

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Review</h1>
        <p className="mt-1 text-sm text-slate-400">
          Spaced-repetition flashcards, due cards only.
        </p>
      </div>

      <ReviewSession initialCards={dueCards} />
    </div>
  );
}
