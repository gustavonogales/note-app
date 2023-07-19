import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/primary/ui/shared/shared.dart';
import 'package:collection/collection.dart';

import '../controller/home_controller.dart';
import '../widgets/empty_placeholder.dart';
import '../widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GlobalStore store;
  late final HomeController controller;

  @override
  void initState() {
    store = locator();
    controller = HomeController();
    controller.getAllNotes();
    super.initState();
  }

  void _navigateToNewNote() {
    context.push(Routes.note);
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) => reaction((_) => controller.errorText, (errorText) {
        if (errorText != null) {
          ScaffoldMessenger.of(context).showSnackBar(Toast(
            context: context,
            message: errorText,
            type: ToastType.error,
          ));
        }
      }),
      child: Scaffold(
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
            ActionButton(
              iconData: store.theme.useLightMode
                  ? FeatherIcons.moon
                  : FeatherIcons.sun,
              onPressed: () => store.theme.toggleTheme(),
            ),
            ActionButton(iconData: FeatherIcons.search, onPressed: () {}),
            ProfileBadge(
              name: store.auth.user!.name,
              avatarUrl: store.auth.user!.avatarUrl,
              onPressed: () => context.push(Routes.profile),
            ),
          ],
        ),
        body: Observer(builder: (_) {
          return RefreshIndicator.adaptive(
            onRefresh: controller.getAllNotes,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(Spacings.xxxs),
                  child: controller.notes.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(top: Spacings.xxxl),
                          child: EmptyPlaceholder(),
                        )
                      : StaggeredGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: Spacings.micro,
                          crossAxisSpacing: Spacings.micro,
                          children: controller.notes.mapIndexed((i, note) {
                            return Observer(
                                key: note.key,
                                builder: (context) {
                                  return StaggeredGridTile.count(
                                    crossAxisCellCount:
                                        controller.layout[i].crossAxisCellCount,
                                    mainAxisCellCount:
                                        controller.layout[i].mainAxisCellCount,
                                    child: NoteCard(note),
                                  );
                                });
                          }).toList(),
                        ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
