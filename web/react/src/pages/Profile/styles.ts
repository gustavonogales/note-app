import { shade } from 'polished';
import styled from 'styled-components';
import bg from '../../assets/bg.svg';

export const Container = styled.div`
  display: flex;
  height: 100vh;
`;

export const Content = styled.div`
  background-image: url(${bg});
  background-repeat: no-repeat;
  background-position: bottom;
  background-size: contain;
  display: flex;
  justify-content: center;
  flex: 1;
`;

export const FormContent = styled.section`
  margin-top: 5em;
  display: flex;
  flex-direction: column;
  width: 370px;

  h1 {
    font-size: 42px;
    margin-bottom: 24px;
    text-align: center;
  }

  button {
    margin-top: 40px;
  }
`;

export const AvatarInput = styled.div`
  margin-bottom: 32px;
  position: relative;
  align-self: center;

  img {
    width: 186px;
    height: 186px;
    object-fit: cover;
    object-position: 0 -25px;
    border-radius: 50%;
  }

  label {
    position: absolute;
    width: 48px;
    height: 48px;
    background: #3b3b3b;
    border-radius: 50%;
    right: 0;
    bottom: 0;
    border: 0;
    transition: background-color 0.2s;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;

    input {
      display: none;
    }

    svg {
      width: 20px;
      height: 20px;
      color: #fff;
    }

    &:hover {
      background: ${shade(0.2, '#3b3b3b')};
    }
  }
`;
