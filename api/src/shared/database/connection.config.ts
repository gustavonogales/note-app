import { join } from 'path';

export default () => ({
  type: process.env.ORM_TYPE,
  host: process.env.ORM_HOST,
  port: process.env.ORM_PORT,
  username: process.env.ORM_USERNAME,
  password: process.env.ORM_PASSWORD,
  database:
    process.env.ORM_TYPE == 'sqlite'
      ? join(__dirname, '..', '..', 'database.sqlite')
      : process.env.ORM_DATABASE,
  entities: [join(__dirname, '../../**/*.entity{.ts,.js}')],
  synchronize: true,
});
