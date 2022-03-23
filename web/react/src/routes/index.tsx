import React, { ReactElement } from 'react';
import { Switch } from 'react-router-dom';
import Route from './Route';
import { SignIn } from '../pages/SignIn';
import { SignUp } from '../pages/SignUp';
import { Home } from '../pages/Home';
import { Profile } from '../pages/Profile';
import { ROUTES } from '../constants';

export function Routes(): ReactElement {
  return (
    <Switch>
      <Route path={ROUTES.SIGNIN} exact component={SignIn} />
      <Route path={ROUTES.SIGNUP} component={SignUp} />
      <Route path={ROUTES.HOME} component={Home} isPrivate />
      <Route path={ROUTES.PROFILE} component={Profile} isPrivate />
    </Switch>
  );
}
