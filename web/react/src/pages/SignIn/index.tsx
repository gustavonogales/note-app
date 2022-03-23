import React, { ReactElement, useCallback, useRef } from 'react';
import * as Yup from 'yup';
import { FiMail, FiLock } from 'react-icons/fi';
import { Form } from '@unform/web';
import { Link, useHistory } from 'react-router-dom';
import { FormHandles } from '@unform/core';
import { Input, Button } from '../../components';
import getValidationErrors from '../../utils/getValidationError';
import { UserSignInCredentials } from '../../types';
import { Background, Container, Content, Links } from './styles';
import signInBackground from '../../assets/signin.svg';
import { useStore } from '../../stores';

export function SignIn(): ReactElement {
  const formRef = useRef<FormHandles>(null);
  const signIn = useStore((state) => state.signIn);
  const history = useHistory();

  const handleSubmit = useCallback(
    async (credentials: UserSignInCredentials) => {
      try {
        formRef.current?.setErrors({});

        const schema = Yup.object().shape({
          email: Yup.string().email('Type a valid email').required('E-mail is required'),
          password: Yup.string().required('Password is required'),
        });

        await schema.validate(credentials, {
          abortEarly: false,
        });

        signIn({
          email: credentials.email,
          password: credentials.password,
        }).then(() => {
          history.push('/home');
        });
      } catch (error) {
        if (error instanceof Yup.ValidationError) {
          const errors = getValidationErrors(error);
          formRef.current?.setErrors(errors);
        }
      }
    },
    [signIn, history],
  );

  return (
    <Container>
      <Content>
        <Form onSubmit={handleSubmit} ref={formRef}>
          <h1>Sign In</h1>
          <Input name='email' icon={FiMail} type='email' placeholder='E-mail' />
          <Input name='password' icon={FiLock} type='password' placeholder='Password' />
          <Button type='submit'>Sign in</Button>
          <Links>
            <Link to='/signup'>create an account</Link>
            <Link to='/forgot'>forgot password</Link>
          </Links>
        </Form>
      </Content>
      <Background>
        <img src={signInBackground} alt='bg' />
        <p>Sign up now and never miss a word</p>
      </Background>
    </Container>
  );
}
