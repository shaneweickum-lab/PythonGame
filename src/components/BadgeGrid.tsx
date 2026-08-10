import type { Badge } from "@/lib/gamification";

export function BadgeGrid({ badges }: { badges: Badge[] }) {
  const earnedCount = badges.filter((b) => b.earned).length;

  return (
    <div>
      <div className="mb-3 text-xs font-semibold uppercase tracking-wide text-slate-500">
        Achievements -- {earnedCount}/{badges.length} earned
      </div>
      <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {badges.map((badge) => (
          <div
            key={badge.id}
            className={`flex items-start gap-3 rounded-lg border p-3 ${
              badge.earned
                ? "border-emerald-500/30 bg-emerald-500/5"
                : "border-slate-800 bg-slate-900 opacity-50"
            }`}
          >
            <span className="text-2xl" aria-hidden="true">
              {badge.icon}
            </span>
            <div>
              <div className={`text-sm font-medium ${badge.earned ? "text-emerald-300" : "text-slate-300"}`}>
                {badge.title}
              </div>
              <div className="mt-0.5 text-xs text-slate-500">{badge.description}</div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
