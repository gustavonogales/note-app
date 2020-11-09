import { NextFunction, Request, Response } from 'express';

export default interface TokenProvider {
  generateToken(userId: string): Promise<string>;
  validateTokenMiddleware(
    request: Request,
    response: Response,
    next: NextFunction,
  ): void;
}
