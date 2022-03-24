import create, { SetState, GetState } from 'zustand';
import { persist } from 'zustand/middleware';
import { StorageService } from '../services';
import { createAuthSlice, AuthStoreSlice } from './authStore';
import { createNoteSlice, NoteStoreSlice } from './noteStore';

type StoreState = AuthStoreSlice & NoteStoreSlice;

export const useStore = create<StoreState>(
  persist(
    (set: SetState<any>, get: GetState<any>) => ({
      ...createAuthSlice(set, get),
      ...createNoteSlice(set, get),
    }),
    {
      name: 'auth',
      getStorage: () => StorageService.getStorage,
      partialize: (state) => ({ user: state.user, token: state.token }),
    },
  ),
);
