import { motion } from 'framer-motion';
import styled from 'styled-components';

type NoteProps = {
  backgroundColor: string;
};

export const Container = styled(motion.div)<NoteProps>`
  background: ${props => props.backgroundColor};
  width: 500px;
  height: 500px;
  padding: 24px;
  border-radius: 8px;
  color: #252525;
  z-index: 2;
`;

export const CenterContainer = styled.div`
  height: 25%;
  display: flex;
  align-items: center;
  justify-content: center;
`;

export const Layer = styled.div`
  background: #000;
  opacity: 0.5;
  top: 0;
  right: 0;
  bottom: 0;
  left: -100px;
  position: absolute;
`;

export const Header = styled.div`
  display: flex;
  flex-direction: row;
  & + button {
    margin: 0 8px;
  }
`;

export const Content = styled.div`
  display: flex;
  flex-direction: column;
  margin: 16px 0;
`;

export const ColorPickerContainer = styled.div`
  position: absolute;
  top: 55px;
  right: -1px;
`;
