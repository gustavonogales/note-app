import { container } from 'tsyringe';
import HashProvider from './adapter/HashProvider';
import BCryptHashProviderImpl from './implementation/BCryptHashProviderImpl';
import hashConfig from './HashConfig';

const providers = {
  bcrypt: container.resolve(BCryptHashProviderImpl),
};

container.registerInstance<HashProvider>(
  'HashProvider',
  providers[hashConfig.driver],
);
