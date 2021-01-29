import { format } from 'winston';

interface LogConfig {
  driver: 'winston';

  config: {
    winston: {
      level: string;
      format: any;
      defaultMeta: { service: string };
      transports: [];
    };
  };
}

export default {
  driver: process.env.LOG_PROVIDER || 'winston',

  config: {
    winston: {
      level: 'info',
      format: format.combine(
        format.timestamp({
          format: 'YYYY-MM-DD HH:mm:ss',
        }),
        format.errors({ stack: true }),
        format.splat(),
        format.json(),
      ),
      defaultMeta: { service: 'your-service-name' },
      transports: [],
    },
  },
} as LogConfig;
