import { User } from '@ionic/cli';

export class Session {
  constructor(public user: User, public token: string) {}
}
