import styled from 'styled-components';
import bg from '../../assets/bg.svg';

export const Container = styled.div`
  display: flex;
  height: 100vh;
`;

export const Content = styled.div`
  padding: 20px 80px;
  background-image: url(${bg});
  background-repeat: no-repeat;
  background-position: bottom;
  background-size: contain;
  display: flex;
  flex-direction: column;
  /* justify-content: center; */
  /* flex: 1; */
`;

export const Toolbar = styled.div`
  margin-bottom: 56px;

  div {
    max-width: 300px;
  }
`;

export const NotesContainer = styled.div`
  background: red;
  width: 85vw;
  margin-top: 24px;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
  grid-gap: 10px;
  grid-auto-rows: minmax(180px, auto);
  grid-auto-flow: dense;
  padding: 10px;
`;
