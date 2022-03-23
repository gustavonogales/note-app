import { motion } from 'framer-motion';
import React, { HTMLAttributes, ReactElement } from 'react';
import { Note } from '../../types';
import { Container } from './styles';

interface CardProps extends HTMLAttributes<HTMLDivElement> {
  note: Note;
}

export function Card({ note, onClick }: CardProps): ReactElement {
  return (
    <Container layoutId={note.id} color={note.color} onClick={onClick}>
      <motion.input value={note.title} disabled />
      <motion.textarea value={note.text} disabled />
      {/* <motion.span>{note.formatted_updated_at}</motion.span> */}
    </Container>
  );
}
