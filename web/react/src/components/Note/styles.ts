import styled from 'styled-components';

type NoteProps = {
  backgroundColor: string;
};

export const Container = styled.div<NoteProps>`
  position: absolute;
  top: 50%;
  left: calc(50% - 50px);
  transform: translateX(-50%) translateY(-50%);
  background: ${props => props.backgroundColor};
  width: 500px;
  height: 500px;
  padding: 24px;
  border-radius: 8px;
  color: ${props => props.theme.colors.note_text};
`;

export const Layer = styled.div`
  background: ${props => props.theme.colors.dark};
  opacity: 0.5;
  top: 0;
  left: -100px;
  width: 100vw;
  height: 100vh;
  position: absolute;
`;

export const Header = styled.div`
  display: flex;
  flex-direction: row;
  & + button {
    margin: 0 8px;
  }
`;

export const Content = styled.div`
  display: flex;
  flex-direction: column;
  margin: 16px 0;
`;

export const ColorPickerContainer = styled.div`
  position: absolute;
  top: 55px;
  right: -1px;
`;
