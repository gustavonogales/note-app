import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/config/config.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/routes/routes.dart';
import 'package:note_app/ui/stores/stores.dart';
import 'package:note_app/ui/utils/utils.dart';
import 'package:note_app/ui/view_models/note.dart';

class NoteCard extends StatelessWidget {
  final ViewNote note;
  NoteStore get noteStore => locator<RootStore>().noteStore;

  const NoteCard(
    this.note, {
    super.key,
  });

  void _onTap(BuildContext context) {
    if (noteStore.deleteMode) {
      note.toggleSelected();
    } else {
      noteStore.setSelectedNote(note);
      context.push(Routes.note);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () => _onTap(context),
        onLongPress: note.toggleSelected,
        child: Hero(
          tag: note.id,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            padding: const EdgeInsets.all(Spacings.xxxs),
            decoration: BoxDecoration(
              border: Border.all(
                color: note.selected
                    ? context.theme.colorScheme.primary
                    : note.color.uiColor,
                width: Spacings.nano,
              ),
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
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 16),
            ),
          ),
        ),
      );
    });
  }
}
