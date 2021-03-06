import { FormHandles } from '@unform/core';
import { Form } from '@unform/web';
import React, { ReactElement, useCallback, useRef } from 'react';
import { FiSearch } from 'react-icons/fi';
import { Input } from '../Input';

export function SearchBar(): ReactElement {
  const formRef = useRef<FormHandles>(null);

  const handleSubmit = useCallback(() => {
    // teste
  }, []);

  return (
    <Form ref={formRef} onSubmit={handleSubmit}>
      <Input
        name="search"
        icon={FiSearch}
        type="text"
        placeholder="Search..."
      />
    </Form>
  );
}
