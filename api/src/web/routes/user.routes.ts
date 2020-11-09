import UserController from '@controller/UserController';
import { Router } from 'express';
import validateTokenMiddleware from '../middleware/validateToken.routes';

const userRouter = Router();

const userController = new UserController();

userRouter.get('/', validateTokenMiddleware, userController.show);

userRouter.post('/', userController.create);

userRouter.put('/', validateTokenMiddleware, userController.update);

export default userRouter;
