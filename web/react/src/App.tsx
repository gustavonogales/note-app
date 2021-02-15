import React from 'react';
import { BrowserRouter } from 'react-router-dom';
import GlobalStyle from './styles/global';
import { AuthProvider } from './hooks/Auth';
import Routes from './routes';
import { NotesProvider } from './hooks/Notes';

const App: React.FC = () => (
  <BrowserRouter>
    <AuthProvider>
      <NotesProvider>
        <Routes />
      </NotesProvider>
    </AuthProvider>
    <GlobalStyle />
  </BrowserRouter>
);

export default App;
