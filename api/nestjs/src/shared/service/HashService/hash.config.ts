interface HashConfig {
  driver: 'bcrypt';
}

export default {
  driver: process.env.HASH_PROVIDER || 'bcrypt',
} as HashConfig;
