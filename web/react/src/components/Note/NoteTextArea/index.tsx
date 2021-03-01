/* eslint-disable react/require-default-props */
/* eslint-disable object-curly-newline */
import { useField } from '@unform/core';
import React, {
  InputHTMLAttributes,
  ReactElement,
  useEffect,
  useRef,
} from 'react';
import { InputText } from './styles';

interface NoteTextAreaProps extends InputHTMLAttributes<HTMLInputElement> {
  name: string;
  customStyle?: object;
}

export function NoteTextArea({
  name,
  customStyle = {},
}: NoteTextAreaProps): ReactElement {
  const textAreaRef = useRef<HTMLTextAreaElement>(null);
  const { fieldName, defaultValue, registerField } = useField(name);

  useEffect(() => {
    registerField({
      name: fieldName,
      ref: textAreaRef.current,
      path: 'value',
    });
  }, [fieldName, registerField]);

  return (
    <InputText
      style={customStyle}
      defaultValue={defaultValue}
      name={name}
      ref={textAreaRef}
    />
  );
}
