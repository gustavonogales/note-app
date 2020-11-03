import 'reflect-metadata';
import 'dotenv/config';
import express from 'express';
import middlewares from './middlewares';
import routes from './routes';
import 'express-async-errors';
import '@shared/container';

const app = express();

app.use(express.json());
app.use(middlewares);
app.use(routes);

app.listen(process.env.APP_PORT, () => {
  console.log(`Server started on port ${process.env.APP_PORT}`);
});
