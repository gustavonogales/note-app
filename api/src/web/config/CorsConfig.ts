interface corsOptions {
  origin: string;
  optionsSuccessStatus: number;
}

export default {
  origin: process.env.CORS_ORIGIN || '*',
  optionsSuccessStatus: process.env.CORS_SUCCESS_STATUS || 200,
} as corsOptions;
