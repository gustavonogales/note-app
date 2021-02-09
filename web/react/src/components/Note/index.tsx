import React from 'react';
import NoteModel from '../../models/Note';
import { Container } from './styles';

type NoteProps = {
  note: NoteModel;
};

const Note: React.FC<NoteProps> = ({ note }) => {
  const test = 1;

  return (
    <Container>
      <p>
        {`${note.title}
        \n
      ${note.text}`}
      </p>
      <span>{note.formatted_updated_at}</span>
    </Container>
  );
};

export default Note;
