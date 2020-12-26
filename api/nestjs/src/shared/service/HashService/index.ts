import hashConfig from './hash.config';
import BCryptHashService from './implementation/BCryptHash.service';

const services = {
  bcrypt: BCryptHashService,
};

export class HashServiceImpl extends services[hashConfig.driver] {}
