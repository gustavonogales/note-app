/* eslint-disable no-param-reassign */
/* eslint-disable prettier/prettier */
import produce from 'immer';
import { StoreSlice } from '../models/StoreSlice';
import Note from '../models/Note';
import { NoteService } from '../services/noteService';

export interface NoteStoreSlice {
  notes: Note[];
  currentNote: Note;
  filteredNotes: Note[];
  error: string;
  isNoteOpen: boolean;
  fetchNotes: () => Promise<void>;
  openNote: (note: Note) => void;
  closeNote: () => void;
  addNote: (note: Note) => Promise<void>;
  updateNote: (note: Note) => Promise<void>;
  searchNotes: (pattern: string) => void;
}

export const createNoteSlice: StoreSlice<NoteStoreSlice> = set => ({
  notes: [] as Note[],
  currentNote: {} as Note,
  filteredNotes: [] as Note[],
  error: '',
  isNoteOpen: false,
  fetchNotes: async () => {
    const notes = await NoteService.getAll();
    set({ notes, filteredNotes: notes });
  },
  openNote: note =>
    set({
      isNoteOpen: true,
      currentNote: note,
    }),
  closeNote: () =>
    set({
      isNoteOpen: false,
      currentNote: {} as Note,
    }),
  addNote: async (note: Note) => {
    await NoteService.create(note);
    set(state => ({
      isNoteOpen: false,
      currentNote: {} as Note,
      notes: [...state.notes, note],
    }));
  },
  updateNote: async (noteToUpdate: Note) => {
    set(state =>
      produce(state, draft => {
        draft.currentNote = {} as Note;
        draft.isNoteOpen = false;
        draft.notes = draft.notes.map(note =>
          note.id === noteToUpdate.id ? noteToUpdate : note,
        );
      }),
    );
  },
  searchNotes: pattern =>
    set(state =>
      produce(state, draft => {
        const search = pattern?.toLowerCase() ?? '';
        draft.filteredNotes = draft.notes.filter(
          (note: Note) =>
            note.text.toLocaleLowerCase().includes(search) ||
            note.title.toLocaleLowerCase().includes(search),
        );
      }),
    ),
});
