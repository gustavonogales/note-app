import React, { useCallback, useEffect, useState } from 'react';
import { Colors } from '../../utils/colors';
import { Container, Layer } from './styles';

type EditNoteProps = {
  closeCallback(): void;
};

const EditNote: React.FC<EditNoteProps> = ({ closeCallback }) => {
  const [color, setColor] = useState('');

  useEffect(() => {
    const keys = Object.values(Colors);
    const randomColor = Math.floor(Math.random() * keys.length);
    setColor(keys[randomColor]);
  }, []);

  return (
    <>
      <Layer onClick={closeCallback} />
      <Container backgroundColor={color}>
        <h1>Teste</h1>
      </Container>
    </>
  );
};

export default EditNote;
