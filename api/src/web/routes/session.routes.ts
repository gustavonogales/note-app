import SessionController from '@controller/SessionController';
import { Router } from 'express';

const sessionRouter = Router();

const sessionController = new SessionController();

sessionRouter.post('/', sessionController.create);

export default sessionRouter;
