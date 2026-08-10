export function ProgressBar({
  done,
  total,
  className = "",
}: {
  done: number;
  total: number;
  className?: string;
}) {
  const pct = total > 0 ? Math.round((done / total) * 100) : 0;

  return (
    <div className={`flex items-center gap-3 ${className}`}>
      <div className="h-2 flex-1 overflow-hidden rounded-full bg-slate-800">
        <div
          className="h-full rounded-full bg-emerald-500 transition-all"
          style={{ width: `${pct}%` }}
        />
      </div>
      <span className="w-24 shrink-0 text-right text-xs text-slate-400">
        {done}/{total} ({pct}%)
      </span>
    </div>
  );
}
