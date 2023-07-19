import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/ui/shared/shared.dart';

class NoteCard extends StatelessWidget {
  final ViewNote note;

  const NoteCard(
    this.note, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('${Routes.note}/${note.id}', extra: note);
      },
      child: Hero(
        tag: note.id,
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
            color: note.color.uiColor,
            borderRadius: BorderRadius.circular(Spacings.nano * 3),
          ),
          child: Text(
            '${note.title}\n${note.text}',
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
