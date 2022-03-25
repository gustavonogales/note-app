/* eslint-disable object-curly-newline */
import React, { ReactElement, useCallback, useEffect, useRef, useState } from 'react';
import { FiChevronLeft, FiPenTool } from 'react-icons/fi';
import { Form } from '@unform/web';
import { FormHandles } from '@unform/core';
import { ColorResult, TwitterPicker } from 'react-color';
import { NoteButton } from './NoteButton';
import { NoteInput } from './NoteInput';
import { NoteTextArea } from './NoteTextArea';
import { Container, Header, Layer, Content, ColorPickerContainer, CenterContainer } from './styles';
import { NoteService } from '@/services';
import { NoteCreate, NoteUpdate, Note as NoteModel } from '@/types';
import { COLORS } from '@/constants';
import { useStore } from '@/stores';

type NoteProps = {
  note: NoteModel;
};

export function Note({ note }: NoteProps): ReactElement {
  const formRef = useRef<FormHandles>(null);
  const [color, setColor] = useState('');
  const [colors, setColors] = useState([] as string[]);
  const [showPicker, setShowPicker] = useState(false);
  const addNote = useStore((state) => state.addNote);
  const updateNote = useStore((state) => state.updateNote);
  const closeNote = useStore((state) => state.closeNote);

  useEffect(() => {
    const keys: string[] = Object.values(COLORS);
    setColors(keys);

    if (Object.keys(note).length !== 0) {
      setColor(note.color);
    } else {
      const randomColor = Math.floor(Math.random() * keys.length);
      setColor(keys[randomColor]);
    }
  }, [note]);

  const handleSubmit = useCallback(
    async ({ title, text }) => {
      if (note.id) {
        const notePayload = {
          id: note.id,
          title,
          text,
          color,
        } as NoteUpdate;

        try {
          NoteService.update(notePayload).then((response) => {
            updateNote(response);
          });
        } catch (err) {
          console.log(err);
        }
      } else {
        const createNote = {
          title,
          text,
          color,
        } as NoteCreate;

        try {
          addNote(createNote);
        } catch (err) {
          console.log(err);
        }
      }
    },
    [note, color],
  );

  function handleColorChange(colorResult: ColorResult) {
    setColor(colorResult.hex);
  }

  return (
    <>
      <Layer onClick={closeNote} />
      <CenterContainer>
        <Container backgroundColor={color} layoutId={note?.id}>
          <Form
            onSubmit={handleSubmit}
            ref={formRef}
            initialData={{
              title: note?.title || 'Title',
              text: note?.text || 'Type something...',
            }}
          >
            <Header>
              <NoteButton onClick={closeNote}>
                <FiChevronLeft size={24} />
              </NoteButton>
              <div style={{ flex: 1 }} />
              <NoteButton
                type='button'
                onClick={() => setShowPicker(!showPicker)}
                customStyle={{ marginLeft: 6, marginRight: 6 }}
              >
                <FiPenTool size={20} />
                {showPicker && (
                  <ColorPickerContainer>
                    <TwitterPicker triangle='top-right' colors={colors} onChange={handleColorChange} />
                  </ColorPickerContainer>
                )}
              </NoteButton>
              <NoteButton type='submit' customStyle={{ paddingLeft: 16, paddingRight: 16 }}>
                Save
              </NoteButton>
            </Header>
            <Content>
              <NoteInput name='title' type='text' />
              <NoteTextArea name='text' type='text' />
            </Content>
          </Form>
        </Container>
      </CenterContainer>
    </>
  );
}
