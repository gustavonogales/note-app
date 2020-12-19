import { Exclude, Expose } from 'class-transformer';

export default class Note {
  public readonly id: string;

  public readonly user_id: string;

  public readonly title: string;

  public readonly text: string;

  @Exclude()
  public readonly updatedAt: Date;

  @Expose({ name: 'updated_at' })
  getUpdatedAt(): Date {
    return this.updatedAt;
  }

  constructor(
    id: string,
    user_id: string,
    title: string,
    text: string,
    updatedAt: Date,
  ) {
    this.id = id;
    this.user_id = user_id;
    this.title = title;
    this.text = text;
    this.updatedAt = updatedAt;
  }
}
