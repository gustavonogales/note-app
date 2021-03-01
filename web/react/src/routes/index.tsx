import React, { ReactElement } from 'react';
import { Switch } from 'react-router-dom';
import Route from './Route';
import { SignIn } from '../pages/SignIn';
import { SignUp } from '../pages/SignUp';
import { Home } from '../pages/Home';
import { Profile } from '../pages/Profile';

export function Routes(): ReactElement {
  return (
    <Switch>
      <Route path="/" exact component={SignIn} />
      <Route path="/signup" component={SignUp} />
      <Route path="/home" component={Home} isPrivate />
      <Route path="/profile" component={Profile} isPrivate />
    </Switch>
  );
}
