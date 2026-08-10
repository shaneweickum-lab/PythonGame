import type { LevelInfo } from "@/lib/gamification";

export function LevelCard({ level, compact = false }: { level: LevelInfo; compact?: boolean }) {
  const pct = Math.round(level.progress * 100);

  return (
    <div>
      <div className="flex items-baseline justify-between gap-3">
        <div>
          <span className="text-xs font-semibold uppercase tracking-wide text-slate-500">
            Level {level.level}
          </span>
          <div className={compact ? "text-lg font-medium text-slate-100" : "text-2xl font-semibold text-slate-100"}>
            {level.title}
          </div>
        </div>
        <div className="text-right text-xs text-slate-500">
          {level.xp.toLocaleString()} XP
        </div>
      </div>

      <div className="mt-3 h-2 overflow-hidden rounded-full bg-slate-800">
        <div
          className="h-full rounded-full bg-emerald-500 transition-all"
          style={{ width: `${pct}%` }}
        />
      </div>
      <div className="mt-1.5 text-xs text-slate-500">
        {level.isMaxLevel
          ? "Max level reached -- every point of XP from here is pure flex."
          : `${level.xpForNextLevel?.toLocaleString()} XP to next level`}
      </div>
    </div>
  );
}
