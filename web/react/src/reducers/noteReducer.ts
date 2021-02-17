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
    default:
      return state;
  }
};

export default noteReducer;
