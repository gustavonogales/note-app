import React from 'react';
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

  return (
    <ReactDOMRoute
      {...props}
      render={() => (isPrivate === !!user ? (
        <Component />
      ) : (
          <Redirect to={{ pathname: isPrivate ? '/' : '/home' }} />
        )
      }
    />
  );
};

export default Route;
