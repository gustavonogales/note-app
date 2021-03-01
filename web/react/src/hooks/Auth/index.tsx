/* eslint-disable object-curly-newline */
import React, {
  createContext,
  ReactElement,
  ReactNode,
  useCallback,
  useContext,
  useState,
} from 'react';
import Auth from './Auth';
import UserAuth from '../../models/UserAuth';
import api from '../../utils/api';
import User from '../../models/User';

interface AuthProviderProps {
  children: ReactNode;
}

const AuthContext = createContext<Auth>({} as Auth);

function useAuth(): Auth {
  const context = useContext(AuthContext);

  if (!context) {
    throw new Error('useAuth must be used witih an AuthProvider');
  }

  return context;
}

function AuthProvider({ children }: AuthProviderProps): ReactElement {
  const [data, setData] = useState<UserAuth>(() => {
    const token = localStorage.getItem('@Notes:token');
    const user = localStorage.getItem('@Notes:user');

    if (token && user) {
      return { token, user: JSON.parse(user) };
    }
    return {} as UserAuth;
  });

  const signIn = useCallback(async ({ email, password }) => {
    const response = await api.post('session', {
      email,
      password,
    });

    const { user, token } = response.data;

    localStorage.setItem('@Notes:token', token);
    localStorage.setItem('@Notes:user', JSON.stringify(user));

    // api.defaults.headers.authorization = `Bearer ${token}`;

    setData({ user, token });
  }, []);

  const signOut = useCallback(() => {
    localStorage.removeItem('@Notes:token');
    localStorage.removeItem('@Notes:user');

    setData({} as UserAuth);
  }, []);

  const updateUser = useCallback(
    (user: User) => {
      localStorage.setItem('@Notes:user', JSON.stringify(user));
      setData({
        token: data.token,
        user,
      });
    },
    [setData, data.token],
  );

  return (
    <AuthContext.Provider
      value={{
        user: data.user,
        signIn,
        signOut,
        updateUser,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export { AuthProvider, useAuth };
