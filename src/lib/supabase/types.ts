export type ConceptStatus = "not_started" | "in_progress" | "done";
export type ProjectType = "micro" | "mini" | "spine";
export type ChallengeDifficulty = "easy" | "medium" | "hard";

export type Phase = {
  id: string;
  order_index: number;
  title: string;
  summary: string | null;
  is_spine_track: boolean;
};

export type Concept = {
  id: string;
  phase_id: string;
  order_index: number;
  title: string;
  notes: string | null;
  status: ConceptStatus;
};

export type Project = {
  id: string;
  phase_id: string;
  concept_id: string | null;
  title: string;
  description: string | null;
  project_type: ProjectType;
  status: ConceptStatus;
  code_snapshot: string | null;
  notes: string | null;
};

export type Flashcard = {
  id: string;
  phase_id: string | null;
  question: string;
  answer: string;
  ease_factor: number;
  interval_days: number;
  next_review_at: string;
  last_reviewed_at: string | null;
};

export type JournalEntry = {
  id: string;
  phase_id: string | null;
  content: string;
  created_at: string;
};

export type Challenge = {
  id: string;
  phase_id: string | null;
  order_index: number;
  title: string;
  difficulty: ChallengeDifficulty;
  prompt: string;
  hint: string | null;
  starter_code: string;
  test_code: string;
  status: ConceptStatus;
  code_snapshot: string | null;
};

export type Database = {
  public: {
    Tables: {
      phases: {
        Row: Phase;
        Insert: Partial<Phase> & Pick<Phase, "order_index" | "title">;
        Update: Partial<Phase>;
        Relationships: [];
      };
      concepts: {
        Row: Concept;
        Insert: Partial<Concept> & Pick<Concept, "phase_id" | "title">;
        Update: Partial<Concept>;
        Relationships: [];
      };
      projects: {
        Row: Project;
        Insert: Partial<Project> &
          Pick<Project, "phase_id" | "title" | "project_type">;
        Update: Partial<Project>;
        Relationships: [];
      };
      flashcards: {
        Row: Flashcard;
        Insert: Partial<Flashcard> & Pick<Flashcard, "question" | "answer">;
        Update: Partial<Flashcard>;
        Relationships: [];
      };
      journal_entries: {
        Row: JournalEntry;
        Insert: Partial<JournalEntry> & Pick<JournalEntry, "content">;
        Update: Partial<JournalEntry>;
        Relationships: [];
      };
      challenges: {
        Row: Challenge;
        Insert: Partial<Challenge> &
          Pick<Challenge, "title" | "prompt" | "starter_code" | "test_code">;
        Update: Partial<Challenge>;
        Relationships: [];
      };
    };
    Views: Record<string, never>;
    Functions: Record<string, never>;
  };
};
