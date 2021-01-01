import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
import User from '../model/user.model';

@Entity('user')
export class UserDAO {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ length: 150 })
  name: string;

  @Column({ length: 150 })
  email: string;

  @Column({ length: 100 })
  password: string;

  @Column('timestamp', { default: 'now()' })
  created_at: Date;

  @Column('text', {
    nullable: true,
  })
  avatar?: string;

  toUser(): User {
    return new User(this.id, this.name, this.email, this.password, this.avatar);
  }
}
