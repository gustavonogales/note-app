import BCryptHashService from './service/BCryptHash.service';
import hashConfig from './util/hash.config';

const services = {
  bcrypt: BCryptHashService,
};

export class HashServiceImpl extends services[hashConfig.driver] {}
