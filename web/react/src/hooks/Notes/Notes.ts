import Note from '../../models/Note';

interface Notes {
  notes: Note[];
  addNote(note: Note): Promise<void>;
  removeNote(note: Note): Promise<void>;
  updateNote(note: Note): Promise<void>;
}

export default Notes;
