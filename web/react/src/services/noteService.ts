import Note from '../models/Note';
import api from '../utils/api';

const getAll = async (): Promise<Note[]> => {
  const response = await api.get('/note');

  const formattedNotes = response.data.map((note: Note) => ({
    ...note,
    formatted_updated_at: new Date(note.updated_at).toLocaleDateString(
      'en-US',
      {
        month: 'short',
        day: 'numeric',
        year: 'numeric',
      },
    ),
  }));

  return formattedNotes;
};

export { getAll };
