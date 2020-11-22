import styled from 'styled-components';
import { shade } from 'polished';

export const Container = styled.div`
  height: 100vh;
  display: flex;
  align-items: stretch;
`;

export const Content = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 100%;
  max-width: 700px;
  align-items: center;

  form {
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
      color: ${shade(0.5, '#fff')};
      transition: 0.3s color;

      &:hover {
        color: ${shade(0.1, '#fff')};
      }
    }
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
  border-right: 1px solid #3b3b3b;

  img {
    margin-bottom: 24px;
  }

  p {
    font-size: 50px;
  }
`;
