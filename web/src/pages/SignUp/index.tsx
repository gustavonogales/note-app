/* eslint-disable prettier/prettier */
import React, { useCallback } from 'react';
import { Form } from '@unform/web';
import {
  FiMail,
  FiLock,
  FiUser,
  FiChevronLeft,
} from 'react-icons/fi';
import signupBackground from '../../assets/signup.svg';
import {
  Background,
  Container,
  Content,
  Links,
} from './styles';

import Input from '../../components/Input';
import Button from '../../components/Button';

const SignUp: React.FC = () => {
  const handleSubmit = useCallback((data: object): void => {
    console.log(data);
  }, []);

  return (
    <Container>
      <Background>
        <img src={signupBackground} alt="bg" />
        <p>Sign up now and never miss a word</p>
      </Background>
      <Content>
        <Form onSubmit={handleSubmit}>
          <h1>Sign Up</h1>
          <Input name="name" icon={FiUser} type="text" placeholder="Name" />
          <Input name="email" icon={FiMail} type="email" placeholder="E-mail" />
          <Input name="password" icon={FiLock} type="password" placeholder="Password" />
          <Input name="confirmPassword" icon={FiLock} type="password" placeholder="Confirm Password" />
          <Button type="submit">Sign up</Button>
          <Links>
            <a href="/">
              <FiChevronLeft />
              SignIn page
            </a>
          </Links>
        </Form>
      </Content>
    </Container>
  );
};

export default SignUp;
