import Note from './Note';

interface NoteState {
  notes: Note[];
  currentNote: Note;
  filteredNotes: Note[];
  error: string;
  isNoteOpen: boolean;
  isLoading: boolean;
}

export default NoteState;
