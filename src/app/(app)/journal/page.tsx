import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { JournalEntryForm } from "@/components/JournalEntryForm";
import { JournalEntryList } from "@/components/JournalEntryList";
import type { JournalEntry, Phase } from "@/lib/supabase/types";

export default async function JournalPage() {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-6">
        <div>
          <h1 className="text-2xl font-semibold text-slate-100">Journal</h1>
          <p className="mt-1 text-sm text-slate-400">
            All reflections across every phase, most recent first.
          </p>
        </div>
        <NotConfiguredNotice />
      </div>
    );
  }

  const supabase = await createClient();

  const [{ data: entries }, { data: phases }] = await Promise.all([
    supabase.from("journal_entries").select("*").order("created_at", { ascending: false }),
    supabase.from("phases").select("*").order("order_index"),
  ]);

  const typedPhases = (phases ?? []) as Phase[];
  const phaseTitles = Object.fromEntries(
    typedPhases.map((p) => [p.id, `Phase ${p.order_index}: ${p.title}`]),
  );

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Journal</h1>
        <p className="mt-1 text-sm text-slate-400">
          All reflections across every phase, most recent first.
        </p>
      </div>

      <JournalEntryForm phases={typedPhases} />

      <JournalEntryList entries={(entries ?? []) as JournalEntry[]} phaseTitles={phaseTitles} />
    </div>
  );
}
