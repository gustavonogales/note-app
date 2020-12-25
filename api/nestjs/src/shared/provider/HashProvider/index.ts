import hashConfig from './HashConfig';
import BCryptHashProvider from './implementation/BCryptHashProviderImpl';

const providers = {
  bcrypt: BCryptHashProvider,
};

export class HashProviderImpl extends providers[hashConfig.driver] {}
