import Note from './Note';

interface NoteState {
  notes: Note[];
  currentNote: Note;
  filteredNotes: Note[];
  error: string;
  isNoteOpen: boolean;
}

export default NoteState;
