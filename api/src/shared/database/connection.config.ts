import { join } from 'path';

export default () => ({
  type: process.env.ORM_PG_TYPE,
  host: process.env.ORM_PG_HOST,
  port: process.env.ORM_PG_PORT,
  username: process.env.ORM_PG_USERNAME,
  password: process.env.ORM_PG_PASSWORD,
  database:
    process.env.ORM_PG_TYPE == 'sqlite'
      ? join(__dirname, '..', '..', 'database.sqlite')
      : process.env.ORM_PG_DATABASE,
  entities: [join(__dirname, '../../**/*.entity{.ts,.js}')],
  synchronize: true,
});
