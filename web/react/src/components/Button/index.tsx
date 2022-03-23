import React, { ButtonHTMLAttributes, ReactElement } from 'react';
import { Container } from './styles';

type ButtonProps = ButtonHTMLAttributes<HTMLButtonElement>;

export function Button({ children, ...props }: ButtonProps): ReactElement {
  return (
    <Container type='button' {...props}>
      {children}
    </Container>
  );
}
