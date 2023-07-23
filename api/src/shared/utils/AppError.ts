import { HttpException, HttpStatus } from '@nestjs/common';

export class AppError extends HttpException {
  constructor(msg: string, httpStatus: HttpStatus) {
    super(
      {
        status: msg,
        error: httpStatus,
      },
      httpStatus,
    );
  }
}
