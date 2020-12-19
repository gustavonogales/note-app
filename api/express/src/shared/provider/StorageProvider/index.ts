import { container } from 'tsyringe';
import StorageProvider from './adapter/StorageProvider';
import DiskStorageProviderImpl from './implementation/DiskStorageProviderImpl';
import storageConfig from './StorageConfig';

const providers = {
  disk: DiskStorageProviderImpl,
};

container.registerSingleton<StorageProvider>(
  'StorageProvider',
  providers[storageConfig.driver],
);
