import 'reflect-metadata';
import 'dotenv/config';
import express from 'express';
import 'express-async-errors';
import cors from 'cors';
import { errors } from 'celebrate';
import StorageConfig from '@shared/provider/StorageProvider/StorageConfig';
import routes from './routes';
import '@shared/container';
import '@shared/database';
// import appError from './middleware/AppError.routes';
import corsConfig from './config/CorsConfig';
// import NewAppError from './middleware/AppError.routes';
import appError from './middleware/AppError.routes';

const app = express();

app.use(cors(corsConfig));
app.use(express.json());
app.use('/files', express.static(StorageConfig.uploadsFolder));
app.use(routes);
app.use(errors());
app.use(appError);

app.listen(process.env.APP_PORT, () => {
  console.log(`💃️ Server started on port ${process.env.APP_PORT}`);
});
