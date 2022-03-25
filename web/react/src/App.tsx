import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import { Routes } from '@/routes';
import GlobalStyle from '@/styles/global';
import '@/interceptors/addTokenRequest';

const App: React.FC = () => (
  <BrowserRouter>
    <Routes />
    <GlobalStyle />
  </BrowserRouter>
);

export default App;
