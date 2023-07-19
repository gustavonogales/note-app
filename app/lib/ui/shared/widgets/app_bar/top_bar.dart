import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/ui/shared/shared.dart';

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
            padding: const EdgeInsets.only(right: Spacings.xxxs),
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
      elevation: 0,
      scrolledUnderElevation: 2,
      surfaceTintColor: context.theme.colorScheme.background.darken(2),
      title: titleText != null ? Heading(titleText!) : null,
      leading: Navigator.of(context).canPop()
          ? Padding(
              padding: const EdgeInsets.only(
                top: Spacings.micro,
                left: Spacings.xxxs,
                bottom: Spacings.micro,
              ),
              child: ActionButton(
                iconData: FeatherIcons.chevronLeft,
                onPressed: context.pop,
                color: backgroundColor,
              ),
            )
          : null,
      actions: _actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
