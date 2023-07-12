import 'package:flutter/material.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

class ActionButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final Color? color;

  const ActionButton({
    required this.iconData,
    required this.onPressed,
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
