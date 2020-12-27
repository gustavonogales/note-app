var path = require('path');

module.exports = {
  "name": 'default',
  "type": 'postgres',
  "host": 'localhost',
  "port": 5433,
  "username": 'postgres',
  "password": 'react-note',
  "database": 'react-note',
  "entities": [path.join(__dirname, '../../**/*.entity{.ts,.js}')],
  "migrations": [
    `./src/shared/database/migrations/*.ts`
  ],
  "cli": {
    "migrationsDir": './src/shared/database/migrations'
  }
}