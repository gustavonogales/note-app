import styled from 'styled-components';
import { shade } from 'polished';

export const Container = styled.aside`
  display: flex;
  flex-direction: column;
  padding: 20px;
  width: 100px;
  border-right: 1px solid ${props => props.theme.colors.divider};
  align-items: center;
  height: 100vh;
  position: fixed;

  svg {
    color: ${props => props.theme.colors.default_text};
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
  background: ${props => props.theme.colors.divider};
  transition: 0.2s background;

  &:hover {
    background: ${props => shade(0.2, props.theme.colors.divider)};
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
  background: ${props => props.theme.colors.divider};
  transition: 0.2s background;

  &:hover {
    background: ${props => shade(0.2, props.theme.colors.divider)};
  }
`;
