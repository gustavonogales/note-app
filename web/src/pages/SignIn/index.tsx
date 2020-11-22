/* eslint-disable prettier/prettier */
import React, { useCallback, useRef } from 'react';
import { FiMail, FiLock } from 'react-icons/fi';
import { Form } from '@unform/web';
import * as Yup from 'yup';
import { FormHandles } from '@unform/core';
import signInBackground from '../../assets/signin.svg';
import {
  Background,
  Container,
  Content,
  Links,
} from './styles';

import Input from '../../components/Input';
import Button from '../../components/Button';
import getValidationErrors from '../../utils/getValidationError';

const SignIn: React.FC = () => {
  const formRef = useRef<FormHandles>(null);

  const handleSubmit = useCallback(async (data: object) => {
    try {
      formRef.current?.setErrors({});

      const schema = Yup.object().shape({
        name: Yup.string().required('Name is required'),
        email: Yup.string()
          .email('Type a valid email')
          .required('E-mail is required'),
        password: Yup.string().required('Password is required'),
      });

      await schema.validate(data, {
        abortEarly: false,
      });
    } catch (error) {
      const errors = getValidationErrors(error);
      formRef.current?.setErrors(errors);
    }
  }, []);
  return (
    <Container>
      <Content>
        <Form onSubmit={handleSubmit} ref={formRef}>
          <h1>Sign In</h1>
          <Input name="email" icon={FiMail} type="email" placeholder="E-mail" />
          <Input name="password" icon={FiLock} type="password" placeholder="Password" />
          <Button type="submit">Sign in</Button>
          <Links>
            <a href="signup">create an account</a>
            <a href="forgot">forgot password</a>
          </Links>
        </Form>
      </Content>
      <Background>
        <img src={signInBackground} alt="bg" />
        <p>Sign up now and never miss a word</p>
      </Background>
    </Container>
  );
};

export default SignIn;
