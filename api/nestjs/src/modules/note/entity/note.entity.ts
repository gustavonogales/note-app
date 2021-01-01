import { UserDAO } from 'src/modules/user/entity/user.entity';
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import Note from '../model/note.model';

@Entity('user')
export class NoteEntity {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @ManyToOne(() => UserDAO, (u) => u)
  user: UserDAO;

  @Column({ nullable: true })
  title: string;

  @Column('text', { nullable: true })
  text: string;

  @Column('timestamp', { default: 'now()' })
  createdAt: Date;

  @Column('timestamp', { default: 'now()' })
  updatedAt: Date;

  toNote(): Note {
    return new Note(
      this.id,
      this.user.id,
      this.title,
      this.text,
      this.updatedAt,
    );
  }
}
