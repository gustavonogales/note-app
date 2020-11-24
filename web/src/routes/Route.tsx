import React, { useCallback } from 'react';
import {
  RouteProps as ReactDOMRouteProps,
  Route as ReactDOMRoute,
  Redirect,
} from 'react-router-dom';
import { useAuth } from '../hooks/Auth';

interface RouteProps extends ReactDOMRouteProps {
  isPrivate?: boolean;
  component: React.ComponentType;
}

const Route: React.FC<RouteProps> = ({
  isPrivate = false,
  component: Component,
  ...props
}) => {
  const { user } = useAuth();

  const handleRender = useCallback(() => {
    if (isPrivate === !!user) {
      return <Component />;
    }
    return <Redirect to={{ pathname: isPrivate ? '/' : '/home' }} />;
  }, [user, isPrivate, Component]);

  return <ReactDOMRoute {...props} render={handleRender} />;
};

export default Route;
