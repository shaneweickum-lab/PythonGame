"use client";

export default function AppError({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  const looksLikeMissingSupabase = /url and key are required/i.test(error.message);

  return (
    <div className="rounded-lg border border-red-900 bg-red-950/40 px-4 py-6">
      <h2 className="text-sm font-semibold text-red-300">Something went wrong loading this page.</h2>
      <p className="mt-2 text-sm text-red-300/80">
        {looksLikeMissingSupabase
          ? "Supabase isn't configured yet. Copy .env.local.example to .env.local and fill in your project's URL and anon key."
          : error.message}
      </p>
      <button
        type="button"
        onClick={reset}
        className="mt-4 rounded-md border border-red-800 px-3 py-1.5 text-xs font-medium text-red-200 hover:bg-red-900/40"
      >
        Try again
      </button>
    </div>
  );
}
