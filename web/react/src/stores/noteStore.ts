import produce from 'immer';
import { StoreSlice, Note, NoteCreate } from '@/types';
import { NoteService } from '@/services';

export interface NoteStoreSlice {
  notes: Note[];
  currentNote: Note;
  filteredNotes: Note[];
  error: string;
  isNoteOpen: boolean;
  fetchNotes: () => Promise<void>;
  openNote: (note: Note) => void;
  closeNote: () => void;
  addNote: (note: NoteCreate) => Promise<void>;
  updateNote: (note: Note) => Promise<void>;
  searchNotes: (pattern: string) => void;
}

export const createNoteSlice: StoreSlice<NoteStoreSlice> = (set) => ({
  notes: [] as Note[],
  currentNote: {} as Note,
  filteredNotes: [] as Note[],
  error: '',
  isNoteOpen: false,
  fetchNotes: async () => {
    const notes = await NoteService.getAll();
    set({ notes, filteredNotes: notes });
  },
  openNote: (note) =>
    set({
      isNoteOpen: true,
      currentNote: note,
    }),
  closeNote: () =>
    set({
      isNoteOpen: false,
      currentNote: {} as Note,
    }),
  addNote: async (note: NoteCreate) => {
    const data = await NoteService.create(note);
    set((state) => ({
      isNoteOpen: false,
      currentNote: {} as Note,
      notes: [...state.notes, data],
      filteredNotes: [...state.notes, data],
    }));
  },
  updateNote: async (noteToUpdate: Note) => {
    set((state) =>
      produce(state, (draft) => {
        draft.currentNote = {} as Note;
        draft.isNoteOpen = false;
        const notes = draft.notes.map((note) => (note.id === noteToUpdate.id ? noteToUpdate : note));
        draft.notes = notes;
        draft.filteredNotes = notes;
      }),
    );
  },
  searchNotes: (pattern) =>
    set((state) =>
      produce(state, (draft) => {
        const search = pattern?.toLowerCase() ?? '';
        draft.filteredNotes = draft.notes.filter(
          (note: Note) =>
            note.text.toLocaleLowerCase().includes(search) || note.title.toLocaleLowerCase().includes(search),
        );
      }),
    ),
});
