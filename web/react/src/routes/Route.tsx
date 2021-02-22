import React, { useCallback } from 'react';
import {
  RouteProps as ReactDOMRouteProps,
  Route as ReactDOMRoute,
  Redirect,
} from 'react-router-dom';
import { useAuth } from '../hooks/Auth';
import api from '../utils/api';

interface RouteProps extends ReactDOMRouteProps {
  isPrivate?: boolean;
  component: React.ComponentType;
}

const Route: React.FC<RouteProps> = ({
  isPrivate = false,
  component: Component,
  ...props
}) => {
  const { user, signOut } = useAuth();

  api.interceptors.response.use(undefined, err => {
    const { status } = err.response;

    if (status === 401) {
      signOut();
    }
    // return null;
  });

  const handleRender = useCallback(() => {
    if (isPrivate === !!user) {
      return <Component />;
    }
    return <Redirect to={{ pathname: isPrivate ? '/' : '/home' }} />;
  }, [user, isPrivate, Component]);

  return <ReactDOMRoute {...props} render={handleRender} />;
};

export default Route;
