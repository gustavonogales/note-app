import User from '../../models/User';
import UserSignInCredentials from '../../models/UserSignInCredentials';

interface Auth {
  user: User;
  signIn(credentials: UserSignInCredentials): Promise<void>;
  signOut(): void;
  updateUser(user: User): void;
}

export default Auth;
