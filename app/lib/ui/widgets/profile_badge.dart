import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/widgets/widgets.dart';

class ProfileBadge extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final File? file;
  final double size;
  final VoidCallback onPressed;

  const ProfileBadge({
    required this.name,
    required this.onPressed,
    this.avatarUrl,
    this.file,
    this.size = 40,
    super.key,
  });

  Widget _buildLoadingWidget(
      _, Widget child, ImageChunkEvent? loadingProgress) {
    return loadingProgress == null ? child : InitialsBadge(name, size: size);
  }

  bool get hasProfilePic => file != null || (avatarUrl ?? '').isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(size)),
        child: hasProfilePic
            ? Image(
                image: file != null
                    ? FileImage(file!) as ImageProvider
                    : NetworkImage(avatarUrl ?? ''),
                fit: BoxFit.cover,
                height: size,
                width: size,
                loadingBuilder: _buildLoadingWidget,
                errorBuilder: (_, __, ___) => InitialsBadge(name, size: size),
              )
            : InitialsBadge(name, size: size),
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
    var first = splittedName.first.trim().isNotEmpty
        ? splittedName.first.substring(0, 1)
        : '';
    var second = '';
    if (splittedName.length > 1 && splittedName.last.trim().isNotEmpty) {
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
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
