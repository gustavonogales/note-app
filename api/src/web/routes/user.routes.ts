import UserController from '@controller/UserController';
import { Router } from 'express';
import { celebrate, Joi, Segments } from 'celebrate';
import validateTokenMiddleware from '../middleware/validateToken.routes';

const userRouter = Router();

const userController = new UserController();

userRouter.get('/', validateTokenMiddleware, userController.show);

userRouter.post(
  '/',
  celebrate({
    [Segments.BODY]: {
      name: Joi.string().required().min(5).max(255),
      email: Joi.string().email().required(),
      password: Joi.string().required().min(6),
    },
  }),
  userController.create,
);

userRouter.put(
  '/',
  validateTokenMiddleware,
  celebrate({
    [Segments.BODY]: {
      name: Joi.string().required().min(5).max(255),
      email: Joi.string().email().required(),
      password: Joi.string().min(6),
      old_password: Joi.string().min(6),
    },
  }),
  userController.update,
);

export default userRouter;
