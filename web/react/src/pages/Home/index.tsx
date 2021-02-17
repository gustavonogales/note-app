/* eslint-disable prettier/prettier */
/* eslint-disable object-curly-newline */
import React, {
  ChangeEvent,
  ReactElement,
  useCallback,
  useEffect,
  useReducer,
  useRef,
} from 'react';
import { FiSearch } from 'react-icons/fi';
import { Form } from '@unform/web';
import { FormHandles } from '@unform/core';
import Menu from '../../components/Menu';
import NoteModel from '../../models/Note';
import Note from '../../components/Note';
import EditNote from '../../components/EditNote';
import Input from '../../components/Input';
import { Container, Content, NotesContainer, Toolbar } from './styles';
import noteReducer from '../../reducers/noteReducer';
import NoteAction from '../../utils/noteAction';
import { getAll } from '../../services/noteService';
import NoteState from '../../models/NoteState';

function Home(): ReactElement {
  const searchFormRef = useRef<FormHandles>(null);
  const [state, dispatch] = useReducer(noteReducer, {} as NoteState);

  useEffect(() => {
    getAll().then(notes => {
      dispatch({ type: NoteAction.FETCH_ALL, payload: { notes } });
    });
  }, []);

  const handleAddAction = useCallback(() => {
    dispatch({ type: NoteAction.OPEN_NOTE });
  }, []);

  const handleOpenNote = useCallback((note: NoteModel) => {
    dispatch({ type: NoteAction.OPEN_NOTE, payload: { note } });
  }, []);

  const handleSearch = useCallback(
    (e: ChangeEvent<HTMLInputElement>) => {
      dispatch({ type: NoteAction.FILTER, payload: { pattern: e.target.value } });
    }, [],
  );

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
        <NotesContainer>
          {state.filteredNotes && state.filteredNotes.map((note: NoteModel) => (
            <Note
              key={note.id}
              note={note}
              onClick={() => handleOpenNote(note)}
            />
          ))}
        </NotesContainer>
        {state.isNoteOpen && (
          <EditNote note={state.currentNote} dispatch={dispatch} />
        )}
      </Content>
    </Container>
  );
}

export default Home;
