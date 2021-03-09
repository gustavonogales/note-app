import { motion } from 'framer-motion';
import styled from 'styled-components';

type NoteProps = {
  color: string;
};

export const Container = styled(motion.div)<NoteProps>`
  cursor: pointer;
  display: flex;
  flex-direction: column;
  padding: 20px;
  width: 180px;
  background: ${props => props.color};
  color: #252525;
  border-radius: 8px;
  height: auto;

  input:disabled,
  textarea:disabled {
    background: transparent;
    color: #252525;
    border: none;
  }

  input {
    margin-bottom: 4px;
    /* font-weight: 500; */
  }

  input,
  textarea {
    overflow: hidden;
    resize: none;
    height: auto;
    width: auto;
  }

  span {
    color: #000;
    opacity: 0.5;
  }
`;
