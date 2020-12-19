import SessionController from '@controller/SessionController';
import { Router } from 'express';
import { celebrate, Joi, Segments } from 'celebrate';

const sessionRouter = Router();

const sessionController = new SessionController();

sessionRouter.post(
  '/',
  celebrate({
    [Segments.BODY]: {
      email: Joi.string().required().email(),
      password: Joi.string().required(),
    },
  }),
  sessionController.create,
);

export default sessionRouter;
