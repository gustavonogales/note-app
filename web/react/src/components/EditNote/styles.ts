import styled from 'styled-components';

type EditNoteProps = {
  backgroundColor: string;
};

export const Container = styled.div<EditNoteProps>`
  position: absolute;
  top: 50%;
  left: calc(50% - 50px);
  transform: translateX(-50%) translateY(-50%);
  background: ${props => props.backgroundColor};
  width: 500px;
  height: 500px;
  padding: 24px;
  border-radius: 8px;
  color: #252525;
`;

export const Layer = styled.div`
  background: #000;
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
