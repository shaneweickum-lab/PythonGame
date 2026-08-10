"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

export const NAV_LINKS = [
  { href: "/", label: "Dashboard", icon: "🏠" },
  { href: "/roadmap", label: "Roadmap", icon: "🗺️" },
  { href: "/challenges", label: "Challenges", icon: "🧩" },
  { href: "/playground", label: "Playground", icon: "▶️" },
  { href: "/spine", label: "Spine", icon: "🌳" },
  { href: "/review", label: "Review", icon: "🔁" },
  { href: "/journal", label: "Journal", icon: "📓" },
];

export function isNavLinkActive(pathname: string, href: string) {
  return href === "/" ? pathname === "/" : pathname.startsWith(href);
}

export function NavLinks() {
  const pathname = usePathname();

  return (
    <nav className="hidden md:flex flex-wrap items-center gap-1">
      {NAV_LINKS.map((link) => {
        const isActive = isNavLinkActive(pathname, link.href);

        return (
          <Link
            key={link.href}
            href={link.href}
            className={`rounded-md px-3 py-1.5 text-sm font-medium transition-colors ${
              isActive
                ? "bg-emerald-600 text-white"
                : "text-slate-300 hover:bg-slate-800 hover:text-white"
            }`}
          >
            {link.label}
          </Link>
        );
      })}
    </nav>
  );
}
