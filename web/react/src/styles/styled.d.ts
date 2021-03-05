import 'styled-components';

declare module 'styled-components' {
  export interface DefaultTheme {
    title: string;

    fonts: {
      font_family: string;
      font_size: number;
    };

    colors: {
      default_text: string;
      note_text: string;
      divider: string;
      accent: string;
      dark: string;
      error: string;
      success: string;
    };
  }
}
