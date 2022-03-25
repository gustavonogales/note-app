import { AxiosRequestConfig } from 'axios';
import { useStore } from '@/stores';
import { api } from '@/utils';

api.interceptors.request.use(
  (request: AxiosRequestConfig) => {
    const { token } = useStore.getState();

    request.headers = {
      Authorization: `Bearer ${token}`,
    };

    return request;
  },
  (err) => {
    Promise.reject(err);
  },
);
