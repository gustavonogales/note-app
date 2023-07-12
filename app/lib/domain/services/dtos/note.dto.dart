import '../../domain.dart';

abstract class NoteDto {
  static Note fromJson(Map<dynamic, dynamic> json) => Note(
        id: json['id'],
        color: json['color'],
        text: json['text'],
        title: json['title'],
        updatedAt: json['updated_at'],
        userId: json['user_id'],
      );
}
