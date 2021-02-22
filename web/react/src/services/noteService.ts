import Note from '../models/Note';
import NoteCreate from '../models/NoteCreate';
import NoteUpdate from '../models/NoteUpdate';
import api from '../utils/api';

async function getAll(): Promise<Note[]> {
  try {
    const response = await api.get('/note');

    const formattedNotes = response.data.map((note: Note) => formatDate(note));

    return formattedNotes;
  } catch (error) {
    console.log(error);
    return [];
  }
}

async function create(note: NoteCreate): Promise<Note> {
  const response = await api.post<Note>('/note', note);

  const formattedNote = formatDate(response.data);

  return formattedNote;
}

async function update(note: NoteUpdate): Promise<Note> {
  const response = await api.put<Note>('/note', note);

  const formattedNote = formatDate(response.data);

  return formattedNote;
}

async function remove(id: string): Promise<void> {
  await api.delete(`/note/${id}`);
}

function formatDate(note: Note): Note {
  return {
    ...note,
    formatted_updated_at: new Date(note.updated_at).toLocaleDateString(
      'en-US',
      {
        month: 'short',
        day: 'numeric',
        year: 'numeric',
      },
    ),
  };
}

// eslint-disable-next-line object-curly-newline
export { getAll, create, update, remove };
