/* eslint-disable prettier/prettier */
import React from 'react';
import { FiMail, FiLock } from 'react-icons/fi';
import homeBackground from '../../assets/home_bg.svg';
import {
  Background,
  Container,
  Content,
  Links,
} from './styles';

import Input from '../../components/Input';
import Button from '../../components/Button';

const SignIn: React.FC = () => (
  <Container>
    <Content>
      <form>
        <h1>Sign In</h1>
        <Input name="email" icon={FiMail} type="email" placeholder="E-mail" />
        <Input name="password" icon={FiLock} type="password" placeholder="Password" />
        <Button type="submit">Sign in</Button>
        <Links>
          <a href="signup">create an account</a>
          <a href="forgot">forgot password</a>
        </Links>
      </form>
    </Content>
    <Background>
      <img src={homeBackground} alt="bg" />
      <p>Sign up now and never miss a word</p>
    </Background>
  </Container>
);

export default SignIn;
