import create, { SetState, GetState } from 'zustand';
import { persist } from 'zustand/middleware';
import { StorageService } from '../services/storageService';
import { createAuthSlice, AuthStoreSlice } from './authStore';

type StoreState = AuthStoreSlice;

export const useStore = create<StoreState>(
  persist(
    (set: SetState<any>, get: GetState<any>) => ({
      ...createAuthSlice(set, get),
    }),
    {
      name: 'auth',
      getStorage: () => StorageService.getStorage,
      partialize: state => ({ user: state.user, token: state.token }),
    },
  ),
);
