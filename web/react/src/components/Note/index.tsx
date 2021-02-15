import React from 'react';
import NoteModel from '../../models/Note';
import { Container } from './styles';

type NoteProps = {
  note: NoteModel;
};

const Note: React.FC<NoteProps> = ({ note }) => {
  const sample = `${note.title}${note.text}`.substr(0, 70);

  return (
    <Container color={note.color}>
      <p>{`${sample}...`}</p>
      <span>{note.formatted_updated_at}</span>
    </Container>
  );
};

export default Note;
