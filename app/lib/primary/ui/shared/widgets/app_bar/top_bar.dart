import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final List<Widget>? actions;
  final Color? backgroundColor;

  const TopBar({this.titleText, this.actions, this.backgroundColor, super.key});

  List<Widget> get _actions {
    List<Widget> list = [];
    if (actions != null) {
      for (Widget action in actions!) {
        list.add(
          Padding(
            padding: const EdgeInsets.only(left: Spacings.xxxs),
            child: action,
          ),
        );
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? context.theme.colorScheme.background,
      forceMaterialTransparency: false,
      shadowColor: context.theme.colorScheme.background.darken(20),
      titleSpacing: 0,
      elevation: 0,
      scrolledUnderElevation: 2,
      automaticallyImplyLeading: false,
      surfaceTintColor: context.theme.colorScheme.background.darken(2),
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Spacings.xxxs),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Navigator.of(context).canPop()
                      ? Padding(
                          padding: const EdgeInsets.only(
                            right: Spacings.xxxs,
                          ),
                          child: ActionButton(
                            iconData: FeatherIcons.chevronLeft,
                            onPressed: context.pop,
                            color: backgroundColor,
                          ),
                        )
                      : const SizedBox.shrink(),
                  titleText != null
                      ? Heading(titleText!)
                      : const SizedBox.shrink(),
                ],
              ),
              Row(children: _actions)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
