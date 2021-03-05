import { shade } from 'polished';
import styled from 'styled-components';

export const Container = styled.button`
  background: ${props => props.theme.colors.accent};
  border: none;
  border-radius: 10px;
  padding: 0 16px;
  color: ${props => props.theme.colors.note_text};
  width: 100%;
  font-size: 24px;
  height: 52px;
  font-weight: 500;
  margin-top: 27px;
  transition: background-color 0.3s;

  &:hover {
    background: ${props => shade(0.2, props.theme.colors.accent)};
  }
`;
