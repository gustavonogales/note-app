/* eslint-disable prettier/prettier */
import styled, { css } from 'styled-components';

interface InputProps {
  styleType: 'title' | 'text';
}

export const Input = styled.input<InputProps>`
  color: #252525;
  background: none;
  border: none;

  ${props => props.styleType === 'title'
    && css`
      font-size: 32px;
    `}

  ${props => props.styleType === 'text'
    && css`
      margin-top: 24px;
      font-size: 14px;
      background: red;
      height: 100vh;
    `}
`;
