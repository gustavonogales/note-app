import winston, { createLogger, Logger } from 'winston';
import LogProvider from '../adapter/LogProvider';
import LogConfig from '../LogConfig';

export default class WinstonLogProviderImpl implements LogProvider {
  private logger: Logger;

  constructor() {
    this.logger = createLogger(LogConfig.config.winston);

    this.logger.add(
      new winston.transports.Console({
        format: winston.format.json(),
      }),
    );
  }

  public async error(message: string, error?: Error): Promise<void> {
    if (!error) this.logger.error(message);
    else this.logger.error(message, error);
  }

  public async info(message: string, error?: Error): Promise<void> {
    if (!error) this.logger.info(message);
    else this.logger.info(message, error);
  }
}
