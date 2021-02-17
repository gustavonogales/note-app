/* eslint-disable object-curly-newline */
import React, { useCallback, useEffect, useRef, useState } from 'react';
import { FiChevronLeft, FiPenTool } from 'react-icons/fi';
import { Form } from '@unform/web';
import { FormHandles } from '@unform/core';
import Note from '../../models/Note';
import NoteButton from '../NoteButton';
import Colors from '../../utils/colors';
import { Container, Header, Layer, Content, Text } from './styles';
import NoteInput from '../NoteInput';
import NoteAction from '../../utils/noteAction';
import { Action } from '../../reducers/noteReducer';

type EditNoteProps = {
  dispatch: React.Dispatch<Action>;
  note: Note;
};

const EditNote: React.FC<EditNoteProps> = ({ dispatch, note }) => {
  const [color, setColor] = useState('');
  const formRef = useRef<FormHandles>(null);
  const textRef = useRef<HTMLDivElement>(null);
  const textAreaRef = useRef<HTMLTextAreaElement>(null);

  useEffect(() => {
    if (Object.keys(note).length !== 0) {
      setColor(note.color);
    } else {
      const keys = Object.values(Colors);
      const randomColor = Math.floor(Math.random() * keys.length);
      setColor(keys[randomColor]);
    }
  }, [note]);

  const handleSubmit = useCallback(() => {
    // dispatch({ type: NoteAction.UPDATE, payload: {} });
    console.log(textRef);
    console.log(textAreaRef.current?.value);
  }, []);

  const handleRevert = useCallback(() => {
    dispatch({ type: NoteAction.CLOSE_NOTE });
  }, []);

  return (
    <>
      <Layer onClick={handleRevert} />
      <Container backgroundColor={color}>
        <Form
          onSubmit={handleSubmit}
          ref={formRef}
          initialData={{
            title: note?.title || 'Title',
            text: note?.text || 'Type something...',
          }}
        >
          <Header>
            <NoteButton onClick={handleRevert}>
              <FiChevronLeft size={24} />
            </NoteButton>
            <div style={{ flex: 1 }} />
            <NoteButton customStyle={{ marginLeft: 6, marginRight: 6 }}>
              <FiPenTool size={20} />
            </NoteButton>
            <NoteButton
              type="submit"
              customStyle={{ paddingLeft: 16, paddingRight: 16 }}
            >
              Save
            </NoteButton>
          </Header>
          <Content>
            <NoteInput name="title" type="text" styleType="title" />
            {/* <NoteInput name="text" type="text" styleType="text" /> */}
            <Text ref={textRef} contentEditable="true">
              {note?.text || 'Type something...'}
            </Text>
            <textarea ref={textAreaRef}>
              {
                // empty
              }
            </textarea>
          </Content>
        </Form>
      </Container>
    </>
  );
};

export default EditNote;
