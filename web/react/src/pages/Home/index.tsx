/* eslint-disable object-curly-newline */
import React, { useEffect, useState } from 'react';
import Menu from '../../components/Menu';
import { Container, Content, NotesContainer, Toolbar } from './styles';
import api from '../../utils/api';
import NoteModel from '../../models/Note';
import SearchBar from '../../components/SearchBar';
import Note from '../../components/Note';

const Home: React.FC = () => {
  const [notes, setNotes] = useState<NoteModel[]>([]);

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

  return (
    <Container>
      <Menu />
      <Content>
        <Toolbar>
          <SearchBar />
        </Toolbar>
        <h1>Notes</h1>
        <NotesContainer>
          {notes.map(note => (
            <Note note={note} />
          ))}
        </NotesContainer>
      </Content>
    </Container>
  );
};

export default Home;
