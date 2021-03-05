/* eslint-disable prettier/prettier */
import { shade } from 'polished';
import styled, { css } from 'styled-components';
import Tooltip from '../Tooltip';

interface ContainerProps {
  isFocused: boolean;
  isFilled: boolean;
  isErrored: boolean;
}

export const Container = styled.div<ContainerProps>`
  background: ${props => props.theme.colors.divider};
  border: 2px solid ${props => props.theme.colors.divider};
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
    color: ${props => props.theme.colors.default_text};
    background: transparent;

    &::placeholder {
      color: ${props => shade(0.4, props.theme.colors.default_text)};
    }
  }

  svg {
    margin-right: 16px;
    color: ${props => shade(0.4, props.theme.colors.default_text)};
  }

  ${props => props.isErrored && css`
    border-color: ${props.theme.colors.error};
  `}

  ${props => props.isFilled && css`
    svg {
      color: ${props.theme.colors.default_text};
    }
  `}

  ${props => props.isFocused && css`
    border-color: ${props.theme.colors.default_text};
    svg {
      color: ${props.theme.colors.default_text};
    }
  `}
`;

export const Error = styled(Tooltip)`
  height: 20px;
  margin-left: 16px;

  svg {
    margin: 0;
    color: ${props => props.theme.colors.error};
  }

  span {
    background: ${props => props.theme.colors.error};
    color: ${props => props.theme.colors.default_text};

    &::before {
      border-color: ${props => props.theme.colors.error} transparent;
    }
  }
`;
