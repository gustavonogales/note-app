import { StoreSlice } from '../models/StoreSlice';
import User from '../models/User';
import UserSignInCredentials from '../models/UserSignInCredentials';
import UserUpdateCredentials from '../models/UserUpdateCredentials';
import { AuthService } from '../services/authService';
import { UserService } from '../services/userService';

export interface AuthStoreSlice {
  user?: User;
  token?: string;
  signIn: (credentials: UserSignInCredentials) => Promise<void>;
  signOut: () => void;
  updateUser: (userUpdate: UserUpdateCredentials) => void;
}

export const createAuthSlice: StoreSlice<AuthStoreSlice> = (set, get) => ({
  user: undefined,
  token: undefined,
  signIn: async ({ email, password }) => {
    const response = await AuthService.signIn({ email, password });

    const { user, token } = response.data;

    set({ user, token });
  },
  signOut: () => {
    set({ user: undefined });
  },
  updateUser: async user => {
    const { data } = await UserService.updateUser(user);
    set({ user: data });
  },
});
