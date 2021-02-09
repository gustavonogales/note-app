import styled from 'styled-components';

export const Container = styled.div`
  cursor: pointer;
  display: flex;
  flex-direction: column;
  padding: 20px;
  width: 180px;
  background: #ffab91;
  color: #252525;
  border-radius: 16px;

  p {
    flex: 1;
  }

  span {
    color: #000;
    opacity: 0.5;
  }
`;
