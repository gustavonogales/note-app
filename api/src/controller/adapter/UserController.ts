import { Request, Response } from 'express';

export default interface UserController {
  create(request: Request, response: Response): Promise<Response>;
}
