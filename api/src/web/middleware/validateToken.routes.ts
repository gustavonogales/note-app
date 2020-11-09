import { Request, Response, NextFunction } from 'express';
import JwtTokenProviderImpl from '@shared/provider/TokenProvider/implementation/JwtTokenProviderImpl';

export default function validateTokenMiddleware(
  request: Request,
  response: Response,
  next: NextFunction,
): void {
  JwtTokenProviderImpl.validateTokenMiddleware(request, response, next);
}
