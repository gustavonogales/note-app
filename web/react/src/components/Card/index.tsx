import React, { HTMLAttributes, ReactElement } from 'react';
import NoteModel from '../../models/Note';
import { Container } from './styles';

interface CardProps extends HTMLAttributes<HTMLDivElement> {
  note: NoteModel;
}

export function Card({ note, onClick }: CardProps): ReactElement {
  const sample = `${note.title}${note.text}`.substr(0, 70);

  return (
    <Container color={note.color} onClick={onClick}>
      <p>{`${sample}...`}</p>
      <span>{note.formatted_updated_at}</span>
    </Container>
  );
}
