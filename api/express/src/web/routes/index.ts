import { Router } from 'express';
import userRouter from './user.routes';
import sessionRouter from './session.routes';
import noteRouter from './note.routes';

const routes = Router();

routes.use('/session', sessionRouter);
routes.use('/user', userRouter);
routes.use('/note', noteRouter);

export default routes;
