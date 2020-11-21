import React from 'react';
import logoImg from '../../assets/logo.svg';
import { Container, Content, Background } from './styles';

const SignIn: React.FC = () => (
  <Container>
    <Content>
      <img src={logoImg} alt="React-Note" />
    </Content>
    <Background />
  </Container>
);

export default SignIn;
