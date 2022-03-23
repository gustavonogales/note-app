import React, { ChangeEvent, ReactElement, useEffect, useRef } from 'react';
import { FiSearch } from 'react-icons/fi';
import { Form } from '@unform/web';
import { FormHandles } from '@unform/core';
import { AnimatePresence, AnimateSharedLayout, motion } from 'framer-motion';
import shallow from 'zustand/shallow';
import { Menu } from '../../components/Menu';
import { Card } from '../../components/Card';
import { Note } from '../../components/Note';
import { Input } from '../../components/Input';
import NoteModel from '../../models/Note';
import { Container, Content, Empty, EmptyContainer, NotesContainer, Toolbar } from './styles';
import { useStore } from '../../store/useStore';

const initialState = {
  notes: [],
  currentNote: {} as NoteModel,
  filteredNotes: [],
  error: '',
  isNoteOpen: false,
  isLoading: true,
};

export function Home(): ReactElement {
  const searchFormRef = useRef<FormHandles>(null);
  const { fetchNotes, filteredNotes, searchNotes, openNote, isNoteOpen, currentNote } = useStore(
    (state) => ({
      fetchNotes: state.fetchNotes,
      filteredNotes: state.filteredNotes,
      searchNotes: state.searchNotes,
      openNote: state.openNote,
      isNoteOpen: state.isNoteOpen,
      currentNote: state.currentNote,
    }),
    shallow,
  );
  const hasNotes = filteredNotes.length !== 0;

  useEffect(() => {
    fetchNotes();
  }, []);

  function handleAddAction() {
    openNote({} as NoteModel);
  }

  function handleOpenNote(note: NoteModel) {
    openNote(note);
  }

  function handleSearch(e: ChangeEvent<HTMLInputElement>) {
    e.preventDefault();
    searchNotes(e.target.value);
  }

  return (
    <AnimateSharedLayout type='crossfade'>
      <Container>
        <Menu addAction={handleAddAction} />
        <Content>
          <Toolbar>
            <Form ref={searchFormRef} onSubmit={handleSearch}>
              <Input name='search' icon={FiSearch} type='text' placeholder='Search...' onChange={handleSearch} />
            </Form>
          </Toolbar>
          <h1>Notes</h1>
          {!hasNotes ? (
            <EmptyContainer>
              <Empty />
              <p>Nothing here...</p>
            </EmptyContainer>
          ) : (
            <NotesContainer>
              {filteredNotes.map((note: NoteModel) => (
                <Card key={note.id} note={note} onClick={() => handleOpenNote(note)} />
              ))}
            </NotesContainer>
          )}
          {isNoteOpen && (
            <AnimatePresence>
              <Note note={currentNote} addNote={addNote} />
            </AnimatePresence>
          )}
        </Content>
      </Container>
    </AnimateSharedLayout>
  );
}
