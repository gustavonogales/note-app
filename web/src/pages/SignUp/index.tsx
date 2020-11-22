/* eslint-disable prettier/prettier */
import React from 'react';
import { FiMail, FiLock, FiUser } from 'react-icons/fi';
import signup from '../../assets/signup.svg';
import {
  Background,
  Container,
  Content,
  Links,
} from './styles';

import Input from '../../components/Input';
import Button from '../../components/Button';

const SignUp: React.FC = () => (
  <Container>
    <Background>
      <img src={signup} alt="bg" />
      <p>Sign up now and never miss a word</p>
    </Background>
    <Content>
      <form>
        <h1>Sign Up</h1>
        <Input name="name" icon={FiUser} type="text" placeholder="Name" />
        <Input name="email" icon={FiMail} type="email" placeholder="E-mail" />
        <Input name="password" icon={FiLock} type="password" placeholder="Password" />
        <Input name="confirmPassword" icon={FiLock} type="password" placeholder="Confirm Password" />
        <Button type="submit">Sign up</Button>
        <Links>
          <a href="/">SignIn page</a>
        </Links>
      </form>
    </Content>
  </Container>
);

export default SignUp;
