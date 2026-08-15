import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NavLinks } from "@/components/NavLinks";
import { MobileTabBar } from "@/components/MobileTabBar";

export default async function AppLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const supabaseConfigured = isSupabaseConfigured();
  const userEmail = supabaseConfigured
    ? (await (await createClient()).auth.getUser()).data.user?.email
    : undefined;

  return (
    <>
      <header className="border-b border-slate-800 bg-slate-900/60">
        <div className="mx-auto flex max-w-5xl flex-wrap items-center justify-between gap-3 px-4 py-3">
          <div className="flex items-center gap-6">
            <Link
              href="/dashboard"
              className="text-sm font-semibold tracking-tight text-slate-100 hover:text-emerald-400"
            >
              <span className="sm:hidden">🐍 Py Mastery</span>
              <span className="hidden sm:inline">🐍 Python Mastery Tracker</span>
            </Link>
            <NavLinks />
          </div>
          {supabaseConfigured ? (
            <form action="/auth/signout" method="post" className="flex items-center gap-3">
              <span className="hidden text-xs text-slate-500 sm:inline">{userEmail}</span>
              <button
                type="submit"
                className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-300 hover:bg-slate-800"
              >
                Sign out
              </button>
            </form>
          ) : (
            <span className="text-xs text-amber-400">
              Supabase not configured -- see .env.local.example
            </span>
          )}
        </div>
      </header>
      <main className="mx-auto flex-1 w-full max-w-5xl px-4 py-8 pb-24 md:pb-8">
        {children}
      </main>
      <MobileTabBar />
    </>
  );
}
