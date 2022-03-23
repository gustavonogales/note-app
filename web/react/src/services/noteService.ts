import produce from 'immer';
import { Note, NoteCreate, NoteUpdate } from '../types';
import { formatDate, api } from '../utils';

export class NoteService {
  private static resource = '/note';

  static async getAll(): Promise<Note[]> {
    try {
      const response = await api.get(this.resource);

      const formattedNotes = response.data.map((note: Note) =>
        produce(note, (draft) => {
          draft.formatted_updated_at = formatDate(draft.updated_at);
        }),
      );

      return formattedNotes;
    } catch (error) {
      console.log(error);
      return [];
    }
  }

  static async create(note: NoteCreate): Promise<Note> {
    const response = await api.post<Note>('/note', note);

    const formattedNote = produce(response.data, (draft) => {
      draft.formatted_updated_at = formatDate(draft.updated_at);
    });

    return formattedNote;
  }

  static async update(note: NoteUpdate): Promise<Note> {
    const response = await api.put<Note>('/note', note);

    const formattedNote = produce(response.data, (draft) => {
      draft.formatted_updated_at = formatDate(draft.updated_at);
    });

    return formattedNote;
  }

  static async remove(id: string): Promise<void> {
    await api.delete(`/note/${id}`);
  }
}
