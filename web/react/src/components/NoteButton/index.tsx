import React, { ButtonHTMLAttributes } from 'react';
import { Button } from './styles';

interface NoteButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  customStyle?: Object;
}

const NoteButton: React.FC<NoteButtonProps> = ({
  customStyle = {},
  children,
  ...props
}) => (
  <Button style={customStyle} {...props}>
    {children}
  </Button>
);

export default NoteButton;
