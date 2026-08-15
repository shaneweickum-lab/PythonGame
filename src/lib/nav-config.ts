export type NavLinkItem = {
  type: "link";
  href: string;
  label: string;
  icon: string;
};

export type NavGroupItem = {
  type: "group";
  label: string;
  icon: string;
  items: { href: string; label: string; description: string }[];
};

export type NavEntry = NavLinkItem | NavGroupItem;

export const NAV_ENTRIES: NavEntry[] = [
  { type: "link", href: "/dashboard", label: "Dashboard", icon: "🏠" },
  {
    type: "group",
    label: "Learning",
    icon: "📚",
    items: [
      {
        href: "/roadmap#beginner",
        label: "Beginner",
        description: "Syntax fluency & data structures",
      },
      {
        href: "/roadmap#intermediate",
        label: "Intermediate",
        description: "OOP, idioms, engineering discipline, systems",
      },
      {
        href: "/roadmap#advanced",
        label: "Advanced",
        description: "Specialization, capstone & the ML track",
      },
      {
        href: "/roadmap#algorithms",
        label: "Algorithms",
        description: "Interview-ready data structures & complexity",
      },
      {
        href: "/challenges",
        label: "Challenges",
        description: "Auto-graded coding exercises, every difficulty",
      },
    ],
  },
  { type: "link", href: "/playground", label: "Playground", icon: "▶️" },
  {
    type: "group",
    label: "More",
    icon: "⋯",
    items: [
      { href: "/foundations", label: "Foundations", description: "Zero-experience start, in order" },
      { href: "/roadmap", label: "Full Roadmap", description: "Every phase, start to finish" },
      { href: "/spine", label: "Spine Project", description: "One project, every phase" },
      { href: "/review", label: "Review", description: "Spaced repetition flashcards" },
      { href: "/journal", label: "Journal", description: "Reflections across all phases" },
      { href: "/achievements", label: "Achievements", description: "Level, streak, and badges" },
    ],
  },
];

/** Flattened list used by the mobile tab bar and for active-state lookups. */
export const ALL_NAV_LINKS: { href: string; label: string; icon: string }[] = NAV_ENTRIES.flatMap(
  (entry) =>
    entry.type === "link"
      ? [entry]
      : entry.items.map((item) => ({ href: item.href, label: item.label, icon: entry.icon })),
);

export function isNavLinkActive(pathname: string, href: string) {
  const path = href.split("#")[0];
  return path === "/dashboard" ? pathname === "/dashboard" : pathname.startsWith(path);
}
