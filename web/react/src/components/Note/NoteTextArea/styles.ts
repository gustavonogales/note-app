/* eslint-disable prettier/prettier */
import styled from 'styled-components';

export const InputText = styled.textarea`
  font-size: 14px;
  margin-top: 24px;
  color: ${props => props.theme.colors.note_text};
  height: 350px;
  border: none;
  resize: none;
  background: none;
`;
