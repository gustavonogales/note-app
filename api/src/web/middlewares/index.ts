import { Router } from 'express';
import appError from './AppError.routes';

const middlewares = Router();

middlewares.use(appError);

export default middlewares;
