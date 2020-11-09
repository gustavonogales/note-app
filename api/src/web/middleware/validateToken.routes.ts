import { Request, Response, NextFunction } from 'express';
import { verify } from 'jsonwebtoken';
import tokenConfig from '@shared/provider/TokenProvider/TokenConfig';
import AppError from '@web/exception/AppError';

interface ITokenPayload {
  iat: number;
  exp: number;
  sub: string;
}

export default function validateToken(
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
