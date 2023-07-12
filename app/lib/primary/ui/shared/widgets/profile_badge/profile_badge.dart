import 'package:flutter/material.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

class ProfileBadge extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final double size;
  final VoidCallback onPressed;

  const ProfileBadge({
    required this.name,
    required this.onPressed,
    this.avatarUrl,
    this.size = 40,
    super.key,
  });

  String? get correctUrl => avatarUrl?.replaceAll('localhost', '10.0.2.2');

  Widget _buildLoadingWidget(
      _, Widget child, ImageChunkEvent? loadingProgress) {
    return loadingProgress == null ? child : InitialsBadge(name, size: size);
  }

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(size)),
        child: Image.network(
          correctUrl ?? '',
          fit: BoxFit.cover,
          height: size,
          width: size,
          loadingBuilder: _buildLoadingWidget,
          errorBuilder: (_, __, ___) => InitialsBadge(name, size: size),
        ),
      ),
    );
  }
}

class InitialsBadge extends StatelessWidget {
  final String name;
  final double size;

  const InitialsBadge(this.name, {required this.size, super.key});

  String get initials {
    var splittedName = name.split(' ');
    final first = splittedName.first.substring(0, 1);
    var second = '';
    if (splittedName.length > 1) {
      second = splittedName.last.substring(0, 1);
    }
    return '$first$second';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      color: context.theme.colorScheme.primary,
      child: Stack(
        children: [
          Center(
            child: Text(
              initials,
              style: TextStyle(
                fontSize: size / 2.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
