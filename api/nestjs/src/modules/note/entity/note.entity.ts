import { UserEntity } from 'src/modules/user/entity/user.entity';
import {
  Column,
  CreateDateColumn,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';
import Note from '../model/note.model';

@Entity('note')
export class NoteEntity {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  user_id: string;

  @ManyToOne(() => UserEntity)
  @JoinColumn({ name: 'user_id' })
  user: UserEntity;

  @Column({ nullable: true })
  title: string;

  @Column('text', { nullable: true })
  text: string;

  @Column()
  color: string;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  toNote(): Note {
    return new Note(
      this.id,
      this.user_id,
      this.title,
      this.text,
      this.color,
      this.updated_at,
    );
  }
}
