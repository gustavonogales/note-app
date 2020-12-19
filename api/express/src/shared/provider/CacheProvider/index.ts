import { container } from 'tsyringe';
import CacheProvider from './adapter/CacheProvider';
import RedisCacheProviderImpl from './implementation/RedisCacheProviderImpl';
import cacheConfig from './CacheConfig';

const providers = {
  redis: container.resolve(RedisCacheProviderImpl),
};

container.registerInstance<CacheProvider>(
  'CacheProvider',
  providers[cacheConfig.driver],
);
