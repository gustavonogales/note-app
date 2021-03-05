import styled from 'styled-components';

export const Container = styled.div`
  position: relative;

  span {
    width: 160px;
    background: ${props => props.theme.colors.accent};
    color: ${props => props.theme.colors.note_text};
    padding: 8px;
    border-radius: 4px;
    font-size: 14px;
    opacity: 0;
    transition: opacity 0.3s;
    position: absolute;
    bottom: calc(100% + 4px);
    left: 50%;
    transform: translateX(-50%);
    visibility: hidden;

    &::before {
      border-style: solid;
      border-color: ${props => props.theme.colors.accent} transparent;
      border-width: 6px 6px 0 6px;
      content: '';
      position: absolute;
      left: 50%;
      bottom: -5px;
      transform: translateX(-50%);
    }
  }

  &:hover span {
    opacity: 1;
    visibility: visible;
  }
`;
