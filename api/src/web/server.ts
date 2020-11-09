import 'reflect-metadata';
import 'dotenv/config';
import express from 'express';
import 'express-async-errors';
import cors from 'cors';
import routes from './routes';
import '@shared/container';
import '@shared/database';
import appError from './exception/AppError.routes';
import corsConfig from './config/CorsConfig';

const app = express();

app.use(cors(corsConfig));
app.use(express.json());
app.use(routes);
app.use(appError);

app.listen(process.env.APP_PORT, () => {
  console.log(`Server started on port ${process.env.APP_PORT}`);
});
