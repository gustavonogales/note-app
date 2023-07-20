import 'package:flutter/material.dart';
import 'package:note_app/ui/utils/utils.dart';

class NoteCard extends StatelessWidget {
  final VoidCallback onTap;
  final String id;
  final String text;
  final Color color;

  const NoteCard({
    required this.id,
    required this.text,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: id,
        child: Container(
          padding: const EdgeInsets.all(Spacings.xxs),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
            color: color,
            borderRadius: BorderRadius.circular(Spacings.nano * 3),
          ),
          child: Text(
            text,
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
