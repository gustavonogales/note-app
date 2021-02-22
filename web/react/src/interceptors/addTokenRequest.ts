import { AxiosRequestConfig } from 'axios';
import api from '../utils/api';

api.interceptors.request.use(
  (request: AxiosRequestConfig) => {
    const token = localStorage.getItem('@Notes:token');

    request.headers = {
      Authorization: `Bearer ${token}`,
    };

    return request;
  },
  err => {
    Promise.reject(err);
  },
);
