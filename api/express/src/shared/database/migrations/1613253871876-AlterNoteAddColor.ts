import { MigrationInterface, QueryRunner, TableColumn } from 'typeorm';

export default class AlterNoteAddColor1613253871876
  implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.addColumn(
      'notes',
      new TableColumn({
        name: 'color',
        type: 'varchar',
        isNullable: true,
        isUnique: false,
        isGenerated: false,
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropColumn('notes', 'color');
  }
}
