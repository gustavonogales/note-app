import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/container.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
              iconData: store.theme.useDarkMode
                  ? FeatherIcons.sun
                  : FeatherIcons.moon,
              onPressed: () =>
                  store.theme.setUseDarkMode(!store.theme.useDarkMode)),
          ActionButton(
              iconData: FeatherIcons.search,
              onPressed: () {
                controller.getAllNotes();
              }),
          ProfileBadge(
            name: store.auth.user!.name,
            avatarUrl: store.auth.user!.avatarUrl,
            onPressed: () => context.push(Routes.profile),
          ),
        ],
      ),
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(Spacings.xxxs),
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: Spacings.micro,
              crossAxisSpacing: Spacings.micro,
              children: [
                ...controller.notes.map((note) {
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: NoteCard(note),
                  );
                })
              ],
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 2,
              //   mainAxisCellCount: 2,
              //   child: NoteCard(
              //     Note(
              //       id: 'e0fa8166-6bec-4ea1-bd3f-ae65223db811',
              //       color: "#FFAB91",
              //       title: 'Lista de compras 3',
              //       text: 'lorem ipsum sin amet dolor.',
              //       userId: '',
              //       updatedAt: '',
              //     ),
              //   ),
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 2,
              //   mainAxisCellCount: 2,
              //   child: NoteCard(
              //     hexColor: "#FFCC80",
              //   ),
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 4,
              //   mainAxisCellCount: 2,
              //   child: NoteCard(
              //     hexColor: "#E6EE9B",
              //   ),
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 2,
              //   mainAxisCellCount: 3,
              //   child: NoteCard(
              //     hexColor: "#CF93D9",
              //   ),
              // ),
            ),
          ),
        );
      }),
      // body: Observer(builder: (context) {
      //   return Padding(
      //     padding: const EdgeInsets.all(Spacings.xxxs),
      //     child: Column(
      //       mainAxisSize: MainAxisSize.max,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [

      //         // EmptyPlaceholder(),
      //       ],
      //     ),
      //   );
      // }),
    );
  }
}
