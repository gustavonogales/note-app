import UserController from '@controller/UserController';
import { Router } from 'express';
import validateToken from '../middleware/validateToken.routes';

const userRouter = Router();

const userController = new UserController();

userRouter.get('/', validateToken, userController.show);

userRouter.post('/', userController.create);

userRouter.put('/', validateToken, userController.update);

export default userRouter;
