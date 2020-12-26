export default {
  "name": process.env.ORM_PG_NAME,
  "type": process.env.ORM_PG_TYPE,
  "host": process.env.ORM_HOST,
  "port": process.env.ORM_PG_PORT,
  "username": process.env.ORM_PG_USERNAME,
  "password": process.env.ORM_PG_PASSWORD,
  "database": process.env.ORM_PG_DATABASE,
  "entities": [`${process.env.ORM_PG_ENTITIES_DIR}/**/dao/*.dao.ts`],
  "migrations": [
    `./src/shared/database/migrations/*.ts`
  ],
  "cli": {
    "migrationsDir": process.env.ORM_PG_MIGRATIONS_DIR
  }
}