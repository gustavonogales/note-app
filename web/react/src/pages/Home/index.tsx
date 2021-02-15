/* eslint-disable object-curly-newline */
import React, { useCallback, useEffect, useState } from 'react';
import Menu from '../../components/Menu';
import { Container, Content, NotesContainer, Toolbar } from './styles';
import api from '../../utils/api';
import NoteModel from '../../models/Note';
import SearchBar from '../../components/SearchBar';
import Note from '../../components/Note';
import { useNotes } from '../../hooks/Notes';
import EditNote from '../../components/EditNote';

const Home: React.FC = () => {
  // const { notes } = useNotes();
  const [notes, setNotes] = useState<NoteModel[]>([]);
  const [isOpen, setIsOpen] = useState(false);

  useEffect(() => {
    api.get('/note').then(response => {
      const formattedNotes = response.data.map((note: NoteModel) => ({
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

      setNotes(formattedNotes);
    });
  }, []);

  const handleAddAction = useCallback(() => {
    setIsOpen(true);
  }, []);

  const handleCloseNote = useCallback(() => {
    setIsOpen(false);
  }, []);

  return (
    <Container>
      <Menu addAction={handleAddAction} />
      <Content>
        <Toolbar>
          <SearchBar />
        </Toolbar>
        <h1>Notes</h1>
        <NotesContainer>
          {notes.map(note => (
            <Note key={note.id} note={note} />
          ))}
        </NotesContainer>
        {isOpen && <EditNote closeCallback={handleCloseNote} />}
      </Content>
    </Container>
  );
};

export default Home;
