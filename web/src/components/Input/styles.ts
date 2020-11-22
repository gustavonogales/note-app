/* eslint-disable prettier/prettier */
import { shade } from 'polished';
import styled, { css } from 'styled-components';

interface ContainerProps {
  isFocused: boolean;
  isFilled: boolean;
}

export const Container = styled.div<ContainerProps>`
  background: #3b3b3b;
  border: 2px solid #3b3b3b;
  border-radius: 10px;
  padding: 8px 16px;
  width: 100%;

  display: flex;
  align-items: center;

  & + div {
    margin-top: 24px;
  }

  input {
    flex: 1;
    border: 0;
    color: #fff;
    background: transparent;

    &::placeholder {
      color: ${shade(0.4, '#fff')};
    }
  }

  svg {
    margin-right: 16px;
    color: ${shade(0.4, '#fff')};
  }

  ${props => props.isFilled && css`
    svg {
      color: #fff;
    }
  `}

  ${props => props.isFocused && css`
    border-color: #fff;
    svg {
      color: #fff;
    }
  `}
`;
