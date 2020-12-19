import { RedisOptions } from 'ioredis';

interface CacheConfig {
  driver: 'redis';

  config: {
    redis: RedisOptions;
  };
}

export default {
  driver: process.env.CACHE_PROVIDER || 'redis',

  config: {
    redis: {
      host: process.env.CACHE_HOST,
      port: process.env.CACHE_PORT,
      password: process.env.CACHE_PASS || undefined,
    },
  },
} as CacheConfig;
