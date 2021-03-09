import { motion } from 'framer-motion';
import styled from 'styled-components';
import bg from '../../assets/bg.svg';

export const Container = styled.div`
  display: flex;
`;

export const Content = styled.div`
  margin-left: 100px;
  background-image: url(${bg});
  background-repeat: no-repeat;
  background-position: bottom;
  background-size: contain;
  display: flex;
  justify-content: center;
  flex: 1;
`;

export const FormContent = styled(motion.section)`
  padding: 5em 0;
  display: flex;
  flex-direction: column;
  width: 400px;
  height: 100vh;
  justify-content: center;
  align-items: center;

  input[type='file'] {
    display: hidden;
  }

  form: {
    width: 100%;
  }

  h1 {
    font-size: 42px;
    margin-bottom: 24px;
  }

  button {
    margin-top: 40px;
  }
`;

export const InputLabel = styled.label`
  position: absolute;
  width: 128px;
  height: 128px;
  border-radius: 50%;
  left: 0;
  top: 0;
  border: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;

  input {
    display: none;
  }
`;
