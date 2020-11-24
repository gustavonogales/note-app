/* eslint-disable object-curly-newline */
import React, { useCallback, useRef } from 'react';
import { Form } from '@unform/web';
import { FormHandles } from '@unform/core';
import * as Yup from 'yup';
import { Link, useHistory } from 'react-router-dom';
import { FiMail, FiLock, FiUser, FiChevronLeft } from 'react-icons/fi';
import signupBackground from '../../assets/signup.svg';
import { Background, Container, Content, Links } from './styles';
import getValidationErrors from '../../utils/getValidationError';

import Input from '../../components/Input';
import Button from '../../components/Button';
import api from '../../utils/api';
import UserSignUp from '../../models/UserSignUp';

const SignUp: React.FC = () => {
  const formRef = useRef<FormHandles>(null);
  const history = useHistory();

  const handleSubmit = useCallback(
    async (data: UserSignUp) => {
      try {
        formRef.current?.setErrors({});

        const schema = Yup.object().shape({
          name: Yup.string().required('Name is required'),
          email: Yup.string()
            .email('Type a valid email')
            .required('E-mail is required'),
          password: Yup.string().min(6, 'At least 6 digits'),
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
};

export default SignUp;
