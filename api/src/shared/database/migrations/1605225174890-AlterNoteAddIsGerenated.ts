import { MigrationInterface, QueryRunner, TableColumn } from 'typeorm';

export default class AlterNoteAddIsGerenated1605225174890
  implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropColumn('notes', 'id');
    await queryRunner.addColumn(
      'notes',
      new TableColumn({
        name: 'id',
        type: 'uuid',
        isPrimary: true,
        isGenerated: true,
        generationStrategy: 'uuid',
        default: 'uuid_generate_v4()',
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropColumn('notes', 'id');
    await queryRunner.addColumn(
      'notes',
      new TableColumn({
        name: 'id',
        type: 'uuid',
        isPrimary: true,
        generationStrategy: 'uuid',
        default: 'uuid_generate_v4()',
      }),
    );
  }
}
