import React, { useCallback } from 'react';
import { RouteProps as ReactDOMRouteProps, Route as ReactDOMRoute, Redirect } from 'react-router-dom';
import { ROUTES } from '../constants/routes';
import { useStore } from '../stores';
import { api } from '../utils';

interface RouteProps extends ReactDOMRouteProps {
  isPrivate?: boolean;
  component: React.ComponentType;
}

const Route: React.FC<RouteProps> = ({ isPrivate = false, component: Component, ...props }) => {
  const { user, signOut } = useStore.getState();

  api.interceptors.response.use(undefined, (err) => {
    const { status } = err.response;

    if (status === 401) {
      signOut();
    }
    return Promise.reject(err);
  });

  const handleRender = useCallback(() => {
    if (isPrivate === !!user) {
      return <Component />;
    }
    return <Redirect to={{ pathname: isPrivate ? '/' : ROUTES.HOME }} />;
  }, [user, isPrivate, Component]);

  return <ReactDOMRoute {...props} render={handleRender} />;
};

export default Route;
