import { User, UserSignInCredentials, UserUpdateCredentials, StoreSlice } from '../types';
import { AuthService, UserService } from '../services';

export interface AuthStoreSlice {
  user?: User;
  token?: string;
  signIn: (credentials: UserSignInCredentials) => Promise<void>;
  signOut: () => void;
  updateUser: (userUpdate: UserUpdateCredentials) => void;
}

export const createAuthSlice: StoreSlice<AuthStoreSlice> = (set) => ({
  user: undefined,
  token: undefined,
  signIn: async ({ email, password }) => {
    const response = await AuthService.signIn({ email, password });
    const { user, token } = response.data;
    set({ user, token });
  },
  signOut: () => set({ user: undefined }),
  updateUser: async (user) => {
    const { data } = await UserService.updateUser(user);
    set({ user: data });
  },
});
