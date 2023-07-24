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
    const tmpFilePath = path.resolve(storageConfig.tmpFolder, file);
    try {
      await fs.promises.stat(tmpFilePath);
    } catch {
      return;
    }

    await fs.promises.unlink(tmpFilePath);
  }

  public async buffer(file: string): Promise<string> {
    const image = fs.readFileSync(path.resolve(storageConfig.tmpFolder, file));
    return image.toString('base64');
  }
}
