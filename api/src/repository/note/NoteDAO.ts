/* eslint-disable camelcase */
import Note from '@entity/Note';
import UserDAO from '@repository/user/UserDAO';

import {
  Column,
  CreateDateColumn,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('notes')
class NoteDAO {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  user_id: string;

  @ManyToOne(() => UserDAO)
  @JoinColumn({ name: 'user_id' })
  user: UserDAO;

  @Column()
  title: string;

  @Column()
  text: string;

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
      this.updated_at,
    );
  }
}

export default NoteDAO;
