import User from 'src/modules/user/model/user.model';

export class Auth {
  constructor(public user: User, public token: string) {}
}
