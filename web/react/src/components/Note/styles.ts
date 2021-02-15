import styled from 'styled-components';

type NoteProps = {
  color: string;
};

export const Container = styled.div<NoteProps>`
  cursor: pointer;
  display: flex;
  flex-direction: column;
  padding: 20px;
  width: 180px;
  background: #ffab91;
  background: ${props => props.color};
  color: #252525;
  border-radius: 8px;

  p {
    flex: 1;
  }

  span {
    color: #000;
    opacity: 0.5;
  }
`;
