import 'package:flutter/material.dart';
import 'package:note_app/ui/extensions/extensions.dart';

class ActionButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final Color? color;
  final String tooltip;

  const ActionButton({
    required this.iconData,
    required this.onPressed,
    required this.tooltip,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        enableFeedback: false,
        tooltip: tooltip,
        style: IconButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor:
              color?.darken(33) ?? context.theme.colorScheme.secondary,
        ),
        icon: Icon(
          iconData,
          size: 24,
          color: color != null ? Colors.white : null,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
