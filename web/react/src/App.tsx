import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import { ThemeProvider } from 'styled-components';
import { AuthProvider } from './hooks/Auth';
import { Routes } from './routes';
import GlobalStyle from './styles/global';
import './interceptors/addTokenRequest';
import dark from './styles/themes/dark';

const App: React.FC = () => (
  <ThemeProvider theme={dark}>
    <BrowserRouter>
      <AuthProvider>
        <Routes />
      </AuthProvider>
      <GlobalStyle />
    </BrowserRouter>
  </ThemeProvider>
);

export default App;
