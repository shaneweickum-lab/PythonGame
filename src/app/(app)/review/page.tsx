import { createClient } from "@/lib/supabase/server";
import { ReviewSession } from "@/components/ReviewSession";
import type { Flashcard } from "@/lib/supabase/types";

export default async function ReviewPage() {
  const supabase = await createClient();

  const { data: dueCards } = await supabase
    .from("flashcards")
    .select("*")
    .lte("next_review_at", new Date().toISOString())
    .order("next_review_at");

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Review</h1>
        <p className="mt-1 text-sm text-slate-400">
          Spaced-repetition flashcards, due cards only.
        </p>
      </div>

      <ReviewSession initialCards={(dueCards ?? []) as Flashcard[]} />
    </div>
  );
}
