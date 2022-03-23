import { StateStorage } from 'zustand/middleware';

export class StorageService {
  static getStorage: StateStorage = {
    getItem(name: string) {
      const value = localStorage.getItem(name);
      return value ? JSON.parse(atob(value)) : value;
    },
    setItem(name, value) {
      localStorage.setItem(name, btoa(JSON.stringify(value)));
    },
    removeItem(name) {
      localStorage.removeItem(name);
    },
  };
}
