import '../../domain.dart';

abstract class UserDto {
  static User fromJson(Map<dynamic, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        avatarUrl: json['avatar_url'],
      );
}
