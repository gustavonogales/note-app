import 'package:collection/collection.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/routes/routes.dart';
import 'package:note_app/ui/stores/stores.dart';
import 'package:note_app/ui/utils/utils.dart';
import 'package:note_app/ui/widgets/widgets.dart';

import '../../container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final RootStore store;
  late final NoteStore noteStore;

  @override
  void initState() {
    store = locator();
    noteStore = store.noteStore;
    noteStore.getAllNotes();
    super.initState();
  }

  void _navigateToNewNote() {
    noteStore.setSelectedNote(null);
    context.push(Routes.note);
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) => reaction((_) => noteStore.errorText, (errorText) {
        if (errorText != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            Toast(
              context: context,
              message: errorText,
              type: ToastType.error,
            ),
          );
        }
      }),
      child: Observer(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: _navigateToNewNote,
            enableFeedback: false,
            elevation: 3,
            backgroundColor: context.theme.colorScheme.primary,
            child: Icon(
              FeatherIcons.plus,
              color: context.theme.colorScheme.onPrimary,
            ),
          ),
          appBar: TopBar(
            titleText: 'Notes',
            actions: [
              if (noteStore.deleteMode)
                ActionButton(
                  iconData: FeatherIcons.trash,
                  onPressed: noteStore.delete,
                ),
              ActionButton(
                iconData: store.themeStore.useLightMode
                    ? FeatherIcons.moon
                    : FeatherIcons.sun,
                onPressed: () => store.themeStore.toggleTheme(),
              ),
              ProfileBadge(
                name: store.userStore.user!.name,
                avatarUrl: store.userStore.user!.avatarUrl,
                onPressed: () => context.push(Routes.profile),
              ),
            ],
          ),
          body: RefreshIndicator.adaptive(
            onRefresh: noteStore.getAllNotes,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(Spacings.xxxs),
                  child: noteStore.notes.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(top: Spacings.xxxl),
                          child: EmptyPlaceholder(),
                        )
                      : StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: Spacings.micro,
                          crossAxisSpacing: Spacings.micro,
                          children: noteStore.notes.mapIndexed(
                            (i, note) {
                              return Observer(
                                key: note.key,
                                builder: (context) {
                                  return StaggeredGridTile.count(
                                    crossAxisCellCount:
                                        noteStore.layout[i].crossAxisCellCount,
                                    mainAxisCellCount:
                                        noteStore.layout[i].mainAxisCellCount,
                                    child: NoteCard(note),
                                  );
                                },
                              );
                            },
                          ).toList(),
                        ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
