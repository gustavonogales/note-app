import { Request, Response, NextFunction } from 'express';
import AppError from '@web/exception/AppError';
import { verify } from 'jsonwebtoken';
import tokenConfig from '@shared/provider/TokenProvider/TokenConfig';
import TokenPayload from '@shared/provider/TokenProvider/adapter/TokenPayload';

export default function validateTokenMiddleware(
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

    const { sub } = decoded as TokenPayload;

    request.user = {
      id: sub,
    };

    return next();
  } catch {
    throw new AppError('Invalid JWT Token.', 401);
  }
}
