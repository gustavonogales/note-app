interface TokenConfig {
  driver: 'jwt';
  secret: string;
  expiresIn: string;
}

export default {
  driver: process.env.TOKEN_PROVIDER || 'jwt',
  secret: process.env.APP_JWT_SECRET,
  expiresIn: process.env.APP_JWT_EXPIRES_IN,
} as TokenConfig;
