/* eslint-disable prettier/prettier */
import React, {
  createContext, useCallback, useContext, useState,
} from 'react';
import Note from '../../models/Note';
import api from '../../utils/api';
import Notes from './Notes';

const NotesContext = createContext<Notes>({} as Notes);

const useNotes = (): Notes => {
  const context = useContext(NotesContext);

  if (!context) {
    throw new Error('useNotes must be used witih an NotesProvider');
  }

  return context;
};

const NotesProvider: React.FC = ({ children }) => {
  const [notes, setNotes] = useState<Note[]>(() => {
    console.log('executou');
    let data = [] as Note[];
    api.get('/note').then(response => {
      data = response.data;
      console.log(data);
    });
    return data;
  });

  const addNote = useCallback(
    async (note: Note) => {
      setNotes([...notes, note]);
      await api.post('/note', note);
    },
    [notes],
  );

  const removeNote = useCallback(async (note: Note) => {
    const newNotes = notes.filter(n => n.id !== note.id);
    setNotes(newNotes);
    await api.delete(`/note${note.id}`);
  }, [notes]);

  const updateNote = useCallback(async (note: Note) => {
    const noteIndex = notes.findIndex(n => n.id === note.id);
    const newNotes = notes;

    newNotes[noteIndex] = note;

    setNotes(newNotes);
    await api.put('/note', note);
  }, [notes]);

  return (
    <NotesContext.Provider
      value={{
        notes,
        addNote,
        removeNote,
        updateNote,
      }}
    >
      {children}
    </NotesContext.Provider>
  );
};

export { useNotes, NotesProvider };
