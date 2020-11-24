import TokenProvider from '../adapter/TokenProvider';

export default class TokenProviderImpl implements TokenProvider {
  public async generateToken(userId: string): Promise<string> {
    const token = userId;

    return token;
  }
}
