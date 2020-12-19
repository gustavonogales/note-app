import { container } from 'tsyringe';
import HashProvider from './adapter/TokenProvider';
import JwtTokenProviderImpl from './implementation/JwtTokenProviderImpl';
import tokenConfig from './TokenConfig';

const providers = {
  jwt: container.resolve(JwtTokenProviderImpl),
};

container.registerInstance<HashProvider>(
  'TokenProvider',
  providers[tokenConfig.driver],
);
