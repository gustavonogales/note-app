import fs from 'fs';
import path from 'path';
import StorageProvider from '../adapter/StorageProvider';
import StorageConfig from '../StorageConfig';

export default class DiskStorageProviderImpl implements StorageProvider {
  public async saveFile(file: string): Promise<string> {
    await fs.promises.rename(
      path.resolve(StorageConfig.tmpFolder, file),
      path.resolve(StorageConfig.uploadsFolder, file),
    );

    return file;
  }

  public async deleteFile(file: string): Promise<void> {
    const filePath = path.resolve(StorageConfig.uploadsFolder, file);

    try {
      await fs.promises.stat(filePath);
    } catch {
      return;
    }

    await fs.promises.unlink(filePath);
  }
}
