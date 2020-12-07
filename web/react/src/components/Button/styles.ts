import { shade } from 'polished';
import styled from 'styled-components';

export const Container = styled.button`
  background: #ffcc80;
  border: none;
  border-radius: 10px;
  padding: 0 16px;
  color: #252525;
  width: 100%;
  font-size: 24px;
  height: 52px;
  font-weight: 500;
  margin-top: 27px;
  transition: background-color 0.3s;

  &:hover {
    background: ${shade(0.2, '#ffcc80')};
  }
`;
