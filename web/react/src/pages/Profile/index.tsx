/* eslint-disable object-curly-newline */
import React, { ChangeEvent, ReactElement, useCallback, useRef } from 'react';
import * as Yup from 'yup';
import { Form } from '@unform/web';
import { FormHandles } from '@unform/core';
import { FiLock, FiMail, FiUser } from 'react-icons/fi';
import { ProfilePic, Menu, Input, Button } from '../../components';
import { api } from '../../utils';
import { UserUpdate } from '../../types';
import { Container, Content, FormContent, InputLabel } from './styles';
import { useStore } from '../../stores';

export function Profile(): ReactElement {
  const user = useStore((state) => state.user);
  const updateUser = useStore((state) => state.updateUser);
  const formRef = useRef<FormHandles>(null);

  const handleSubmit = useCallback(
    async (data: UserUpdate) => {
      try {
        formRef.current?.setErrors({});
        const schema = Yup.object().shape({
          email: Yup.string().required('Email is required').email('Must be a valid email'),
          name: Yup.string().required('Name is required').min(3, 'Name must have 3 characters'),
          old_password: Yup.string(),
          password: Yup.string().when('old_password', {
            is: (val) => !!val.length,
            then: Yup.string().required('New password is required').min(6, 'Must have at least 6 characters'),
            otherwise: Yup.string(),
          }),
          password_confirmation: Yup.string().oneOf([Yup.ref('password'), undefined], 'Senhas devem ser iguais'),
        });

        await schema.validate(data, {
          abortEarly: false,
        });

        const { name, email, old_password, password } = data;

        const formData = {
          name,
          email,
          ...(old_password ? { old_password, password } : {}),
        };
        formRef.current?.clearField('old_password');
        formRef.current?.clearField('password');
        formRef.current?.clearField('password_confirmation');

        updateUser(formData);
      } catch (err) {
        console.error(err);
      }
    },
    [updateUser],
  );

  const handleAvatarChange = useCallback(
    (e: ChangeEvent<HTMLInputElement>) => {
      if (e.target.files) {
        const data = new FormData();

        data.append('avatar', e.target.files[0]);

        api.patch('/user/avatar', data).then((response) => updateUser(response.data));
      }
    },
    [updateUser],
  );

  return (
    <Container>
      <Menu hasProfileButton={false} hasBackButton hasAddButton={false} />
      <Content>
        <FormContent initial={{ opacity: 0, x: 100 }} animate={{ opacity: 1, x: 0 }} transition={{ duration: 0.5 }}>
          <ProfilePic user={user} size={64}>
            <InputLabel htmlFor='avatar'>
              <input type='file' id='avatar' onChange={handleAvatarChange} />
            </InputLabel>
          </ProfilePic>
          <h1>{user?.name}</h1>
          <Form
            onSubmit={handleSubmit}
            ref={formRef}
            initialData={{
              email: user?.email,
              name: user?.name,
            }}
          >
            <Input name='email' icon={FiMail} type='email' placeholder='E-mail' />
            <Input name='name' icon={FiUser} type='text' placeholder='Name' />
            <Input
              containerStyle={{ marginTop: 40 }}
              name='old_password'
              icon={FiLock}
              type='password'
              placeholder='Current password'
            />
            <Input name='password' icon={FiLock} type='password' placeholder='New password' />
            <Input name='password_confirmation' icon={FiLock} type='password' placeholder='Confirm new password' />
            <Button type='submit'>Save changes</Button>
          </Form>
        </FormContent>
      </Content>
    </Container>
  );
}
