/* eslint-disable object-curly-newline */
import React, { ReactElement, useCallback, useRef } from 'react';
import * as Yup from 'yup';
import { Form } from '@unform/web';
import { FormHandles } from '@unform/core';
import { Link, useHistory } from 'react-router-dom';
import { FiMail, FiLock, FiUser, FiChevronLeft } from 'react-icons/fi';
import UserSignUp from '../../models/UserSignUp';
import api from '../../utils/api';
import { Input } from '../../components/Input';
import { Button } from '../../components/Button';
import signupBackground from '../../assets/signup.svg';
import getValidationErrors from '../../utils/getValidationError';
import { Background, Container, Content, Links } from './styles';

export function SignUp(): ReactElement {
  const formRef = useRef<FormHandles>(null);
  const history = useHistory();

  const handleSubmit = useCallback(
    async (data: UserSignUp) => {
      try {
        formRef.current?.setErrors({});

        const schema = Yup.object({
          name: Yup.string().required('Name is required'),
          email: Yup.string()
            .email('Type a valid email')
            .required('E-mail is required'),
          password: Yup.string()
            .required('Senha obrigatória')
            .min(6, 'At least 6 digits'),
          confirmPassword: Yup.string().oneOf(
            [Yup.ref('password'), undefined],
            'Senhas devem ser iguais',
          ),
        });

        await schema.validate(data, {
          abortEarly: false,
        });

        const { name, email, password } = data;

        await api.post('/user', {
          name,
          email,
          password,
        });

        history.push('/');
      } catch (error) {
        const errors = getValidationErrors(error);
        formRef.current?.setErrors(errors);
      }
    },
    [history],
  );

  return (
    <Container>
      <Background>
        <img src={signupBackground} alt="bg" />
        <p>Sign up now and never miss a word</p>
      </Background>
      <Content>
        <Form onSubmit={handleSubmit} ref={formRef}>
          <h1>Sign Up</h1>
          <Input name="name" icon={FiUser} type="text" placeholder="Name" />
          <Input name="email" icon={FiMail} type="email" placeholder="E-mail" />
          <Input
            name="password"
            icon={FiLock}
            type="password"
            placeholder="Password"
          />
          <Input
            name="confirmPassword"
            icon={FiLock}
            type="password"
            placeholder="Confirm Password"
          />
          <Button type="submit">Sign up</Button>
          <Links>
            <Link to="/">
              <FiChevronLeft />
              SignIn page
            </Link>
          </Links>
        </Form>
      </Content>
    </Container>
  );
}
