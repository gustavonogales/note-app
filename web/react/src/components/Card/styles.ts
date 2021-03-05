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
  background: ${props => props.color};
  color: ${props => props.theme.colors.note_text};
  border-radius: 8px;

  p {
    flex: 1;
  }

  span {
    color: ${props => props.theme.colors.dark};
    opacity: 0.5;
  }
`;
