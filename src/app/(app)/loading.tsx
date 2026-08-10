export default function Loading() {
  return (
    <div className="space-y-4">
      <div className="h-6 w-48 animate-pulse rounded bg-slate-800" />
      <div className="h-4 w-96 animate-pulse rounded bg-slate-800" />
      <div className="space-y-3 pt-2">
        {Array.from({ length: 4 }).map((_, i) => (
          <div key={i} className="h-16 animate-pulse rounded-lg bg-slate-900" />
        ))}
      </div>
    </div>
  );
}
