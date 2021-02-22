/* eslint-disable react/no-unescaped-entities */
/* eslint-disable prettier/prettier */
/* eslint-disable object-curly-newline */
import React, {
  ChangeEvent,
  ReactElement,
  useEffect,
  useReducer,
  useRef,
} from 'react';
import { FiSearch } from 'react-icons/fi';
import { Form } from '@unform/web';
import { FormHandles } from '@unform/core';
import Menu from '../../components/Menu';
import NoteModel from '../../models/Note';
import Card from '../../components/Card';
import Note from '../../components/Note';
import Input from '../../components/Input';
import noteReducer from '../../reducers/noteReducer';
import NoteAction from '../../utils/noteAction';
import NoteState from '../../models/NoteState';
import { getAll } from '../../services/noteService';
import { Container, Content, Empty, EmptyContainer, NotesContainer, Toolbar } from './styles';

const initialState = {
  notes: [],
  currentNote: {} as NoteModel,
  filteredNotes: [],
  error: '',
  isNoteOpen: false,
};

function Home(): ReactElement {
  const searchFormRef = useRef<FormHandles>(null);
  const [state, dispatch] = useReducer(noteReducer, initialState as NoteState);
  const hasNotes = state.filteredNotes.length !== 0;

  useEffect(() => {
    getAll().then(notes => {
      dispatch({ type: NoteAction.FETCH_ALL, payload: { notes } });
    });
  }, []);

  function handleAddAction() {
    dispatch({ type: NoteAction.OPEN_NOTE });
  }

  function handleOpenNote(note: NoteModel) {
    dispatch({ type: NoteAction.OPEN_NOTE, payload: { note } });
  }

  function handleSearch(e: ChangeEvent<HTMLInputElement>) {
    dispatch({ type: NoteAction.FILTER, payload: { pattern: e.target.value } });
  }

  return (
    <Container>
      <Menu addAction={handleAddAction} />
      <Content>
        <Toolbar>
          <Form ref={searchFormRef} onSubmit={handleSearch}>
            <Input
              name="search"
              icon={FiSearch}
              type="text"
              placeholder="Search..."
              onChange={handleSearch}
            />
          </Form>
        </Toolbar>
        <h1>Notes</h1>
        { !hasNotes && (
        <EmptyContainer>
          <Empty />
          <p>You don't have notes yet.</p>
        </EmptyContainer>
        )}
        <NotesContainer>
          {hasNotes && state.filteredNotes.map((note: NoteModel) => (
            <Card
              key={note.id}
              note={note}
              onClick={() => handleOpenNote(note)}
            />
          ))}
        </NotesContainer>
        {state.isNoteOpen && (
          <Note note={state.currentNote} dispatch={dispatch} />
        )}
      </Content>
    </Container>
  );
}

export default Home;
