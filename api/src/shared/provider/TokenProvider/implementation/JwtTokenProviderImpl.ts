import { sign } from 'jsonwebtoken';
import TokenProvider from '../adapter/TokenProvider';
import tokenConfig from '../TokenConfig';

export default class JwtTokenProviderImpl implements TokenProvider {
  public async generateToken(userId: string): Promise<string> {
    const token = sign({}, tokenConfig.secret, {
      subject: userId,
      expiresIn: tokenConfig.expiresIn,
    });

    return token;
  }
}
