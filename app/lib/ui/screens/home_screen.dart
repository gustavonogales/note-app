import 'package:collection/collection.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/config/container/container.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/routes/routes.dart';
import 'package:note_app/ui/stores/stores.dart';
import 'package:note_app/ui/utils/utils.dart';
import 'package:note_app/ui/widgets/widgets.dart';

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

  int _calculateAxisCount(ScreenSize size) {
    switch (size) {
      case ScreenSize.mobile:
        return 4;
      case ScreenSize.tablet:
        return 8;
      case ScreenSize.desktop:
        return 14;
      default:
        return 4;
    }
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
            tooltip: context.l10n.newNote,
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
              if (kIsWeb)
                ActionButton(
                  iconData: FeatherIcons.refreshCw,
                  tooltip: context.l10n.refresh,
                  onPressed: () => noteStore.getAllNotes(refreshing: true),
                ),
              if (noteStore.deleteMode)
                ActionButton(
                  tooltip: context.l10n.deleteSelectedNotes,
                  iconData: FeatherIcons.trash,
                  onPressed: noteStore.delete,
                ),
              ActionButton(
                tooltip: context.l10n.switchTheme,
                iconData: store.uiStore.useLightMode
                    ? FeatherIcons.moon
                    : FeatherIcons.sun,
                onPressed: () => store.uiStore.toggleTheme(),
              ),
              ProfileBadge(
                name: store.userStore.user!.name,
                avatar: store.userStore.user!.avatar,
                onPressed: () => context.push(Routes.profile),
              ),
            ],
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return RefreshIndicator.adaptive(
              onRefresh: () => noteStore.getAllNotes(refreshing: true),
              child: Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  children: [
                    Observer(builder: (context) {
                      return Container(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        padding: const EdgeInsets.all(Spacings.xxxs),
                        child: noteStore.loading
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : noteStore.notes.isEmpty
                                ? const Center(child: EmptyPlaceholder())
                                : StaggeredGrid.count(
                                    crossAxisCount: _calculateAxisCount(
                                      store.uiStore.screenSize(context),
                                    ),
                                    mainAxisSpacing: Spacings.micro,
                                    crossAxisSpacing: Spacings.micro,
                                    children: noteStore.notes.mapIndexed(
                                      (i, note) {
                                        return Observer(
                                          key: note.key,
                                          builder: (context) {
                                            return StaggeredGridTile.count(
                                              crossAxisCellCount: noteStore
                                                  .layout[i].crossAxisCellCount,
                                              mainAxisCellCount: noteStore
                                                  .layout[i].mainAxisCellCount,
                                              child: NoteCard(note),
                                            );
                                          },
                                        );
                                      },
                                    ).toList(),
                                  ),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
