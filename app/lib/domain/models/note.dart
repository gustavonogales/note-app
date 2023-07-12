final class Note {
  final String id;
  final String userId;
  final String title;
  final String text;
  final String updatedAt;
  final String color;

  const Note({
    required this.id,
    required this.userId,
    required this.title,
    required this.text,
    required this.updatedAt,
    required this.color,
  });
}
