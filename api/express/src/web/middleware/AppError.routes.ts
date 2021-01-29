import WinstonLogProviderImpl from '@shared/provider/LogProvider/implementation/WinstonLogProviderImpl';
import { Request, Response, NextFunction } from 'express';
import { container } from 'tsyringe';
import AppError from '../exception/AppError';

export default async function appError(
  error: Error,
  request: Request,
  response: Response,
  _: NextFunction,
): Promise<Response> {
  const logger = container.resolve(WinstonLogProviderImpl);

  logger.error('SOMETHING WENT WRONG', error);

  if (error instanceof AppError) {
    return response.status(error.statusCode).json({
      status: 'error',
      message: error.message,
    });
  }

  return response.status(500).json({
    status: 'error',
    message: 'Internal server error',
  });
}
