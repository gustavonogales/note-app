/* eslint-disable react/require-default-props */
/* eslint-disable object-curly-newline */
import { useField } from '@unform/core';
import React, {
  InputHTMLAttributes,
  ReactElement,
  useEffect,
  useRef,
} from 'react';
import { Input } from './styles';

interface NoteInputProps extends InputHTMLAttributes<HTMLInputElement> {
  name: string;
  customStyle?: object;
  styleType: 'title' | 'text';
}

function NoteInput({
  name,
  customStyle = {},
  styleType,
  ...props
}: NoteInputProps): ReactElement {
  const inputRef = useRef<HTMLInputElement>(null);
  const { fieldName, defaultValue, registerField } = useField(name);

  useEffect(() => {
    registerField({
      name: fieldName,
      ref: inputRef.current,
      path: 'value',
    });
  }, [fieldName, registerField]);
  return (
    <Input
      styleType={styleType}
      style={customStyle}
      defaultValue={defaultValue}
      name={name}
      ref={inputRef}
      {...props}
    />
  );
}

export default NoteInput;
