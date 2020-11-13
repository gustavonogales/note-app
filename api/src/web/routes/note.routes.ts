import NoteController from '@controller/NoteController';
import { Router } from 'express';
import { celebrate, Joi, Segments } from 'celebrate';
import validateTokenMiddleware from '../middleware/validateToken.routes';

const noteRouter = Router();
const noteController = new NoteController();

noteRouter.use(validateTokenMiddleware);

noteRouter.get('/', noteController.index);

noteRouter.get(
  '/:id',
  celebrate({
    [Segments.PARAMS]: {
      id: Joi.string().required(),
    },
  }),
  noteController.show,
);

noteRouter.post(
  '/',
  celebrate({
    [Segments.BODY]: {
      title: Joi.string().required().min(1).max(255),
      text: Joi.string().required(),
    },
  }),
  noteController.create,
);

noteRouter.put(
  '/',
  celebrate({
    [Segments.BODY]: {
      id: Joi.string().required(),
      title: Joi.string().required().min(1).max(255),
      text: Joi.string().required(),
    },
  }),
  noteController.update,
);

noteRouter.delete(
  '/:id',
  celebrate({
    [Segments.PARAMS]: {
      id: Joi.string().required(),
    },
  }),
  noteController.delete,
);

export default noteRouter;
