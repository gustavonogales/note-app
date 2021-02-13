/* eslint-disable prettier/prettier */
/* eslint-disable implicit-arrow-linebreak */
import styled, { css } from 'styled-components';

type ContainerProps = {
  size: number;
  avatar_url: string;
};

export const Container = styled.div<ContainerProps>`
  display: flex;
  cursor: pointer;
  border-radius: 50%;
  height: ${props => props.size * 2}px;
  width: ${props => props.size * 2}px;
  margin-bottom: 24px;
  transition: 0.2s filter;
  font-size: ${props => props.size}px;
  background: #ffcc80;
  ${props =>
    props.avatar_url
    && css`
      background-image: url(${props.avatar_url});
      background-position: 0 -10px;
      background-size: cover;
    `}
  align-items: center;
  justify-content: center;
  position: relative;

  span {
    font-size: 1em;
    margin-top: -3px;
  }

  &:hover {
    filter: brightness(80%);
  }
`;
