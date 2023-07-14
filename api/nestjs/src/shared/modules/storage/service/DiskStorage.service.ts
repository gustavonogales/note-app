import * as fs from 'fs';
import * as path from 'path';
import { Injectable } from '@nestjs/common';
import StorageService from './Storage.interface';
import storageConfig from '../util/storage.config';

@Injectable()
export default class DiskStorageService implements StorageService {
  public async saveFile(file: string): Promise<string> {
    await fs.promises.rename(
      path.resolve(storageConfig.tmpFolder, file),
      path.resolve(storageConfig.publicFolder, file),
    );

    return file;
  }

  public async deleteFile(file: string): Promise<void> {
    const filePath = path.resolve(storageConfig.publicFolder, file);

    try {
      await fs.promises.stat(filePath);
    } catch {
      return;
    }

    await fs.promises.unlink(filePath);
  }
}
