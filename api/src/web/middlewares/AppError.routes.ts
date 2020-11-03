import { Request, Response, NextFunction } from 'express';
import AppError from '../exception/AppError';

export default async function appError(
  error: Error,
  request: Request,
  response: Response,
  _: NextFunction,
): Promise<Response> {
  if (error instanceof AppError) {
    return response.status(error.statusCode).json({
      status: 'error',
      message: error.message,
    });
  }

  console.error(error);

  return response.status(500).json({
    status: 'error',
    message: 'Internal server error',
  });
}
