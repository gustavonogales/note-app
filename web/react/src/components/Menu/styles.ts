import styled from 'styled-components';
import { shade } from 'polished';

export const Container = styled.aside`
  display: flex;
  flex-direction: column;
  padding: 20px;
  width: 100px;
  border-right: 1px solid #3b3b3b;
  align-items: center;
  height: 100vh;
  position: fixed;

  svg {
    color: #fff;
  }
`;

export const BackButton = styled.button`
  display: block;
  cursor: pointer;
  border: none;
  background: none;
  margin-bottom: 24px;
`;

export const AddButton = styled.button`
  cursor: pointer;
  border: none;
  padding: 6px 8px;
  border-radius: 50%;
  background: #3b3b3b;
  transition: 0.2s background;

  &:hover {
    background: ${shade(0.2, '#3b3b3b')};
  }
`;

export const Flex1 = styled.div`
  flex: 1;
`;

export const LogoutButton = styled.button`
  cursor: pointer;
  border: none;
  padding: 6px 8px;
  border-radius: 50%;
  background: #3b3b3b;
  transition: 0.2s background;

  &:hover {
    background: ${shade(0.2, '#3b3b3b')};
  }
`;
