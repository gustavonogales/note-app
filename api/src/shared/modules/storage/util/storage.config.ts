import * as multer from 'multer';
import { resolve } from 'path';
import crypto from 'crypto';

const root = resolve(__dirname, '..', '..', '..', '..', '..');
const tmpFolder = resolve(root, 'tmp');

interface StorageConfig {
  driver: 'disk';

  tmpFolder: string;
  publicFolder: string;
}

export default {
  driver: process.env.STORAGE_PROVIDER,

  tmpFolder,
  publicFolder: resolve(root, 'public'),
} as StorageConfig;
