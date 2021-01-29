import { container } from 'tsyringe';
import LogProvider from './adapter/LogProvider';
import WinstonLogProviderImpl from './implementation/WinstonLogProviderImpl';
import LogConfig from './LogConfig';

const providers = {
  winston: WinstonLogProviderImpl,
};

container.registerSingleton<LogProvider>(
  'LogProvider',
  providers[LogConfig.driver],
);
