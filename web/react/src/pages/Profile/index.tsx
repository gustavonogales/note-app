/* eslint-disable object-curly-newline */
import React, { ChangeEvent, useCallback, useRef } from 'react';
import { Form } from '@unform/web';
import { FormHandles } from '@unform/core';
import * as Yup from 'yup';
import { FiLock, FiMail, FiUser } from 'react-icons/fi';
import Button from '../../components/Button';
import Input from '../../components/Input';
import Menu from '../../components/Menu';
import { useAuth } from '../../hooks/Auth';
import api from '../../utils/api';
import { Container, Content, FormContent, InputLabel } from './styles';
import UserUpdate from '../../models/UserUpdate';
import ProfilePic from '../../components/ProfilePic';

const Profile: React.FC = () => {
  const { user, updateUser } = useAuth();
  const formRef = useRef<FormHandles>(null);

  const handleSubmit = useCallback(
    async (data: UserUpdate) => {
      try {
        formRef.current?.setErrors({});
        const schema = Yup.object().shape({
          email: Yup.string()
            .required('Email is required')
            .email('Must be a valid email'),
          name: Yup.string()
            .required('Name is required')
            .min(3, 'Name must have 3 characters'),
          old_password: Yup.string(),
          password: Yup.string().when('old_password', {
            is: val => !!val.length,
            then: Yup.string()
              .required('New password is required')
              .min(6, 'Must have at least 6 characters'),
            otherwise: Yup.string(),
          }),
          password_confirmation: Yup.string().oneOf(
            [Yup.ref('password'), undefined],
            'Senhas devem ser iguais',
          ),
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

        const response = await api.put('/user', formData);

        formRef.current?.clearField('old_password');
        formRef.current?.clearField('password');
        formRef.current?.clearField('password_confirmation');

        updateUser(response.data);
      } catch (err) {
        console.log(err);
      }
    },
    [updateUser],
  );

  const handleAvatarChange = useCallback(
    (e: ChangeEvent<HTMLInputElement>) => {
      if (e.target.files) {
        const data = new FormData();

        data.append('avatar', e.target.files[0]);

        api
          .patch('/user/avatar', data)
          .then(response => updateUser(response.data));
      }
    },
    [updateUser],
  );

  return (
    <Container>
      <Menu hasProfileButton={false} hasBackButton hasAddButton={false} />
      <Content>
        <FormContent>
          <ProfilePic user={user} size={64}>
            <InputLabel htmlFor="avatar">
              <input type="file" id="avatar" onChange={handleAvatarChange} />
            </InputLabel>
          </ProfilePic>
          <h1>{user.name}</h1>
          <Form
            onSubmit={handleSubmit}
            ref={formRef}
            initialData={{
              email: user.email,
              name: user.name,
            }}
          >
            <Input
              name="email"
              icon={FiMail}
              type="email"
              placeholder="E-mail"
            />
            <Input name="name" icon={FiUser} type="text" placeholder="Name" />
            <Input
              containerStyle={{ marginTop: 40 }}
              name="old_password"
              icon={FiLock}
              type="password"
              placeholder="Current password"
            />
            <Input
              name="password"
              icon={FiLock}
              type="password"
              placeholder="New password"
            />
            <Input
              name="password_confirmation"
              icon={FiLock}
              type="password"
              placeholder="Confirm new password"
            />
            <Button type="submit">Save changes</Button>
          </Form>
        </FormContent>
      </Content>
    </Container>
  );
};

export default Profile;
