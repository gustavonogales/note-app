import '../../domain.dart';

abstract class UserDto {
  static User fromJson(Map<dynamic, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        avatarUrl: json['avatar_url'],
      );

  static Map<String, dynamic> toJson(User user) => {
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'avatar_url': user.avatarUrl,
      };
}
