import { AxiosResponse } from 'axios';
import { useAuth } from '../hooks/Auth';
import api from '../utils/api';

api.interceptors.response.use((response: AxiosResponse) => {
  if (response.status === 401) {
    const { signOut } = useAuth();
    signOut();
  }
  return response;
});
