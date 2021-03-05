import styled, { keyframes } from 'styled-components';
import { shade } from 'polished';

export const Container = styled.div`
  height: 100vh;
  display: flex;
  align-items: stretch;
`;

const appearFromRight = keyframes`
  from {
    opacity: 0;
    transform: translateX(50px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
`;

export const Content = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 100%;
  max-width: 550px;
  align-items: center;

  form {
    animation: ${appearFromRight} 0.7s;
    margin: 80px 0;
    width: 340px;
    text-align: center;

    h1 {
      margin-bottom: 50px;
      font-size: 50px;
      font-weight: 400;
    }

    a {
      text-decoration: none;
      color: ${props => shade(0.5, props.theme.colors.default_text)};
      transition: 0.3s color;
      display: flex;
      align-items: center;

      svg {
        margin-right: 16px;
      }

      &:hover {
        color: ${props => shade(0.1, props.theme.colors.default_text)};
      }
    }
  }

  @media (max-width: 1100px) {
    max-width: 100%;
  }
`;

export const Links = styled.div`
  margin-top: 24px;
  display: flex;
  justify-content: space-between;
`;

export const Background = styled.div`
  display: flex;
  flex: 1;
  flex-direction: column;
  justify-content: center;
  text-align: center;
  border-right: 1px solid ${props => props.theme.colors.divider};
  padding: 24px;

  img {
    max-width: 100%;
    width: 40rem;
    margin: 0 auto;
    height: auto;
    margin-bottom: 24px;
  }

  p {
    font-size: 32px;
  }

  @media (max-width: 1100px) {
    display: none;
  }
`;
