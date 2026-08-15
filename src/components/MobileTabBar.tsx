"use client";

import { useState } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { NAV_ENTRIES, isNavLinkActive, type NavGroupItem } from "@/lib/nav-config";

export function MobileTabBar() {
  const pathname = usePathname();
  const [openGroup, setOpenGroup] = useState<NavGroupItem | null>(null);
  // Tracks which pathname the sheet was opened on (as state, not a ref, so
  // reading it during render stays a pure derivation, not a ref access) --
  // a navigation away closes the sheet without needing a setState-in-effect.
  const [openedForPathname, setOpenedForPathname] = useState<string | null>(null);
  const activeGroup = openGroup && openedForPathname === pathname ? openGroup : null;

  function toggleGroup(entry: NavGroupItem) {
    if (activeGroup?.label === entry.label) {
      setOpenGroup(null);
      return;
    }
    setOpenedForPathname(pathname);
    setOpenGroup(entry);
  }

  return (
    <>
      {activeGroup && (
        <button
          type="button"
          aria-label="Close menu"
          onClick={() => setOpenGroup(null)}
          className="fixed inset-0 z-40 bg-black/50 md:hidden"
        />
      )}

      {activeGroup && (
        <div
          className="fixed inset-x-0 bottom-16 z-40 mx-3 rounded-lg border border-slate-800 bg-slate-900 py-1.5 shadow-xl shadow-black/40 md:hidden"
          style={{ marginBottom: "env(safe-area-inset-bottom)" }}
        >
          <div className="px-3 py-1.5 text-xs font-semibold uppercase tracking-wide text-slate-500">
            {activeGroup.label}
          </div>
          {activeGroup.items.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              onClick={() => setOpenGroup(null)}
              className="block px-3 py-2 active:bg-slate-800"
            >
              <div className="text-sm font-medium text-slate-100">{item.label}</div>
              <div className="mt-0.5 text-xs text-slate-500">{item.description}</div>
            </Link>
          ))}
        </div>
      )}

      <nav
        className="fixed inset-x-0 bottom-0 z-40 flex border-t border-slate-800 bg-slate-900/95 backdrop-blur md:hidden"
        style={{ paddingBottom: "env(safe-area-inset-bottom)" }}
      >
        {NAV_ENTRIES.map((entry) => {
          if (entry.type === "link") {
            const isActive = isNavLinkActive(pathname, entry.href);
            return (
              <Link
                key={entry.href}
                href={entry.href}
                className={`flex flex-1 min-w-16 flex-col items-center gap-0.5 py-2 text-[11px] font-medium ${
                  isActive ? "text-emerald-400" : "text-slate-400"
                }`}
              >
                <span className="text-base" aria-hidden="true">
                  {entry.icon}
                </span>
                {entry.label}
              </Link>
            );
          }

          const isActive =
            activeGroup?.label === entry.label ||
            entry.items.some((item) => isNavLinkActive(pathname, item.href));
          return (
            <button
              key={entry.label}
              type="button"
              onClick={() => toggleGroup(entry)}
              className={`flex flex-1 min-w-16 flex-col items-center gap-0.5 py-2 text-[11px] font-medium ${
                isActive ? "text-emerald-400" : "text-slate-400"
              }`}
            >
              <span className="text-base" aria-hidden="true">
                {entry.icon}
              </span>
              {entry.label}
            </button>
          );
        })}
      </nav>
    </>
  );
}
