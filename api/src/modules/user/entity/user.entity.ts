import {
  Column,
  CreateDateColumn,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';
import User from '../model/user.model';
import { NoteEntity } from 'src/modules/note/entity/note.entity';

@Entity('user')
export class UserEntity {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @OneToMany(() => NoteEntity, (note) => note.user)
  notes: NoteEntity[];

  @Column({ length: 150 })
  name: string;

  @Column({ length: 150 })
  email: string;

  @Column({ length: 100 })
  password: string;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  @Column('text', {
    nullable: true,
  })
  avatar?: string;

  toUser(): User {
    return new User(this.id, this.name, this.email, this.password, this.avatar);
  }
}
