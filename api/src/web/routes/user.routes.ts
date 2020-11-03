import UserControllerImpl from '@controller/UserControllerImpl';
import { Router, Request, Response } from 'express';

const userRouter = Router();

const userController = new UserControllerImpl();

userRouter.get('/', (request: Request, response: Response) => {
  return response.json({ status: 'ok' });
});

userRouter.post('/', userController.create);

export default userRouter;
