import React, { ButtonHTMLAttributes, ReactElement } from 'react';
import { Button } from './styles';

interface NoteButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  customStyle?: React.CSSProperties;
}

export function NoteButton({ customStyle = {}, children, ...props }: NoteButtonProps): ReactElement {
  return (
    <Button style={customStyle} {...props}>
      {children}
    </Button>
  );
}
