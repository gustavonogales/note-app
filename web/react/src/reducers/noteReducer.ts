/* eslint-disable prettier/prettier */
/* eslint-disable no-case-declarations */
import Note from '../models/Note';
import NoteState from '../models/NoteState';
import NoteAction from '../utils/noteAction';

export interface Action {
  type: string;
  payload?: {
    pattern?: string;
    notes?: Note[];
    note?: Note;
  };
}

// eslint-disable-next-line consistent-return
const noteReducer = (state: NoteState, action: Action): any => {
  switch (action.type) {
    case NoteAction.FETCH_ALL:
      return {
        ...state,
        notes: action.payload?.notes,
        filteredNotes: action.payload?.notes,
      };
    case NoteAction.FILTER:
      if (action.payload) {
        const pattern = action.payload.pattern
          ? action.payload.pattern.toLocaleLowerCase()
          : '';

        const filteredNotes = state.notes.filter(
          (note: Note) => note.text.toLocaleLowerCase().includes(pattern)
          || note.title.toLocaleLowerCase().includes(pattern),
        );
        return {
          ...state,
          filteredNotes,
        };
      }
      break;
    case NoteAction.OPEN_NOTE:
      return {
        ...state,
        currentNote: action.payload?.note || {},
        isNoteOpen: true,
      };
    case NoteAction.CLOSE_NOTE:
      return {
        ...state,
        currentNote: {},
        isNoteOpen: false,
      };
    case NoteAction.ADD:
      const notes = [...state.notes, action.payload?.note];
      return {
        notes,
        filteredNotes: notes,
        currentNote: {},
        isNoteOpen: false,
        error: '',
      };
    case NoteAction.UPDATE:
      if (action.payload?.note) {
        const noteToUpdate = action.payload?.note;
        const updatedNotes = state.notes.map(note => (
          note.id === noteToUpdate.id
            ? noteToUpdate
            : note));
        return {
          notes: updatedNotes,
          filteredNotes: updatedNotes,
          currentNote: {},
          isNoteOpen: false,
          error: '',
        };
      }
      return state;
    default:
      return state;
  }
};

export default noteReducer;
