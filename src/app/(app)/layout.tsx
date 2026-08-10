import { createClient } from "@/lib/supabase/server";
import { NavLinks } from "@/components/NavLinks";

export default async function AppLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const supabase = await createClient();
  const { data } = await supabase.auth.getUser();

  return (
    <>
      <header className="border-b border-slate-800 bg-slate-900/60">
        <div className="mx-auto flex max-w-5xl flex-wrap items-center justify-between gap-3 px-4 py-3">
          <div className="flex items-center gap-6">
            <span className="text-sm font-semibold tracking-tight text-slate-100">
              🐍 Python Mastery Tracker
            </span>
            <NavLinks />
          </div>
          <form action="/auth/signout" method="post" className="flex items-center gap-3">
            <span className="text-xs text-slate-500">{data.user?.email}</span>
            <button
              type="submit"
              className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-300 hover:bg-slate-800"
            >
              Sign out
            </button>
          </form>
        </div>
      </header>
      <main className="mx-auto flex-1 w-full max-w-5xl px-4 py-8">{children}</main>
    </>
  );
}
