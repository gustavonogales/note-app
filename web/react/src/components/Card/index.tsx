import React, { HTMLAttributes } from 'react';
import NoteModel from '../../models/Note';
import { Container } from './styles';

interface CardProps extends HTMLAttributes<HTMLDivElement> {
  note: NoteModel;
}

const Card: React.FC<CardProps> = ({ note, onClick }) => {
  const sample = `${note.title}${note.text}`.substr(0, 70);

  return (
    <Container color={note.color} onClick={onClick}>
      <p>{`${sample}...`}</p>
      <span>{note.formatted_updated_at}</span>
    </Container>
  );
};

export default Card;
