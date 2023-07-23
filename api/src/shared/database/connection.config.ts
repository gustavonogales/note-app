import { join } from 'path';

export default () => ({
  type: process.env.ORM_PG_TYPE,
  database: 'database.sqlite',
  entities: [join(__dirname, '../../**/*.entity{.ts,.js}')],
  synchronize: true,
});
