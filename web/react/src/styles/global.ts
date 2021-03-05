import { createGlobalStyle } from 'styled-components';

export default createGlobalStyle`
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    outline: 0;
  }

  body {
    background: ${props => props.theme.colors.note_text};
    color: ${props => props.theme.colors.default_text};
    -webkit-font-smoothing: antialiased;
  }

  body, input, button, textarea {
    font-family: ${props => props.theme.fonts.font_family}, serif;
    font-size: ${props => props.theme.fonts.font_size}px;
  }

  h1, h2, h3, h4, h5, h6 strong {
    font-weight: 500;
  }

  button {
    cursor: pointer;
  }
`;
