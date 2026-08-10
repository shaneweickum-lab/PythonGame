import type { StreakInfo } from "@/lib/gamification";

export function StreakCard({ streak }: { streak: StreakInfo }) {
  return (
    <div>
      <span className="text-xs font-semibold uppercase tracking-wide text-slate-500">
        Streak
      </span>
      <div className="mt-1 flex items-baseline gap-2">
        <span className="text-2xl font-semibold text-slate-100">
          {streak.current > 0 ? "🔥" : "💤"} {streak.current}
        </span>
        <span className="text-sm text-slate-400">
          day{streak.current === 1 ? "" : "s"}
        </span>
      </div>
      <div className="mt-1.5 text-xs text-slate-500">
        {streak.current === 0
          ? "Complete something today to start a new streak."
          : `Best: ${streak.longest} day${streak.longest === 1 ? "" : "s"}`}
      </div>
    </div>
  );
}
