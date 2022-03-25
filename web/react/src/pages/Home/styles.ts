import styled from 'styled-components';
import bg from '@/assets/bg.svg';
import emptyImg from '@/assets/empty.svg';

export const Container = styled.div`
  display: flex;
  height: 100vh;
`;

export const Content = styled.div`
  margin-left: 100px;
  padding: 20px 80px 0px;
  background-image: url(${bg});
  background-repeat: no-repeat;
  background-position: bottom;
  background-size: contain;
  display: flex;
  flex: 1;
  flex-direction: column;
  position: relative;
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
  /* background: red; */
  /* width: 85vw; */
  margin-top: 24px;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
  grid-gap: 10px;
  grid-auto-rows: minmax(180px, auto);
  grid-auto-flow: dense;
  padding: 10px;
`;

export const EmptyContainer = styled.div`
  align-self: center;
  width: 500px;
  height: 500px;
  display: flex;
  flex-direction: column;
  /* background: red; */
  align-items: center;

  p {
    font-size: 24px;
  }
`;

export const Empty = styled.div`
  background: url(${emptyImg}) no-repeat center center;
  background-size: contain;
  height: 100vh;
  width: 100%;
`;
