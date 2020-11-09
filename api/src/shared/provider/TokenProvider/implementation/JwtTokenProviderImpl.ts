import { sign, verify } from 'jsonwebtoken';
import { Request, Response, NextFunction } from 'express';
import AppError from '@web/exception/AppError';
import TokenProvider from '../adapter/TokenProvider';
import tokenConfig from '../TokenConfig';

interface ITokenPayload {
  iat: number;
  exp: number;
  sub: string;
}

export default class JwtTokenProviderImpl implements TokenProvider {
  public async generateToken(userId: string): Promise<string> {
    const token = sign({}, tokenConfig.secret, {
      subject: userId,
      expiresIn: tokenConfig.expiresIn,
    });

    return token;
  }

  public static validateTokenMiddleware(
    request: Request,
    response: Response,
    next: NextFunction,
  ): void {
    const authHeader = request.headers.authorization;

    if (!authHeader) {
      throw new AppError('JWT Token is missing.', 401);
    }

    const [, token] = authHeader.split(' ');

    try {
      const decoded = verify(token, tokenConfig.secret);

      const { sub } = decoded as ITokenPayload;

      request.user = {
        id: sub,
      };

      return next();
    } catch {
      throw new AppError('Invalid JWT Token.', 401);
    }
  }
}
