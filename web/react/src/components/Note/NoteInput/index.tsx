/* eslint-disable react/require-default-props */
/* eslint-disable object-curly-newline */
import { useField } from '@unform/core';
import React, { InputHTMLAttributes, ReactElement, useEffect, useRef } from 'react';
import { InputTitle } from './styles';

interface NoteInputProps extends InputHTMLAttributes<HTMLInputElement> {
  name: string;
  customStyle?: React.CSSProperties;
}

export function NoteInput({ name, customStyle = {} }: NoteInputProps): ReactElement {
  const inputRef = useRef<HTMLInputElement>(null);
  const { fieldName, defaultValue, registerField } = useField(name);

  useEffect(() => {
    registerField({
      name: fieldName,
      ref: inputRef.current,
      path: 'value',
    });
  }, [fieldName, registerField]);

  return <InputTitle style={customStyle} defaultValue={defaultValue} name={name} ref={inputRef} />;
}
