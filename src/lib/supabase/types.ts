export type ConceptStatus = "not_started" | "in_progress" | "done";
export type ProjectType = "mini" | "spine";

export interface Phase {
  id: string;
  order_index: number;
  title: string;
  summary: string | null;
  is_spine_track: boolean;
}

export interface Concept {
  id: string;
  phase_id: string;
  title: string;
  notes: string | null;
  status: ConceptStatus;
}

export interface Project {
  id: string;
  phase_id: string;
  title: string;
  description: string | null;
  project_type: ProjectType;
  status: ConceptStatus;
  code_snapshot: string | null;
  notes: string | null;
}

export interface Flashcard {
  id: string;
  phase_id: string | null;
  question: string;
  answer: string;
  ease_factor: number;
  interval_days: number;
  next_review_at: string;
  last_reviewed_at: string | null;
}

export interface JournalEntry {
  id: string;
  phase_id: string | null;
  content: string;
  created_at: string;
}

export interface Database {
  public: {
    Tables: {
      phases: {
        Row: Phase;
        Insert: Partial<Phase> & Pick<Phase, "order_index" | "title">;
        Update: Partial<Phase>;
      };
      concepts: {
        Row: Concept;
        Insert: Partial<Concept> & Pick<Concept, "phase_id" | "title">;
        Update: Partial<Concept>;
      };
      projects: {
        Row: Project;
        Insert: Partial<Project> &
          Pick<Project, "phase_id" | "title" | "project_type">;
        Update: Partial<Project>;
      };
      flashcards: {
        Row: Flashcard;
        Insert: Partial<Flashcard> & Pick<Flashcard, "question" | "answer">;
        Update: Partial<Flashcard>;
      };
      journal_entries: {
        Row: JournalEntry;
        Insert: Partial<JournalEntry> & Pick<JournalEntry, "content">;
        Update: Partial<JournalEntry>;
      };
    };
  };
}
