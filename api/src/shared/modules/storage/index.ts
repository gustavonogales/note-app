import DiskStorageService from './service/DiskStorage.service';
import storageConfig from './util/storage.config';

const services = {
  disk: DiskStorageService,
};

export class StorageServiceImpl extends DiskStorageService {}
