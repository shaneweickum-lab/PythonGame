export function NotConfiguredNotice() {
  return (
    <div className="rounded-lg border border-amber-900 bg-amber-950/30 px-4 py-6 text-sm text-amber-300">
      Supabase isn&apos;t configured yet. Copy <code>.env.local.example</code> to{" "}
      <code>.env.local</code> and fill in your project&apos;s URL and anon key to
      see data here.
    </div>
  );
}
