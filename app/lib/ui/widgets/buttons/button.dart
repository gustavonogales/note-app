import 'package:flutter/material.dart';
import 'package:note_app/ui/extensions/extensions.dart';

enum ButtonColor {
  primary,
  opaque,
  error,
}

class Button extends StatelessWidget {
  final String _text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonColor color;

  const Button(
    this._text, {
    this.onPressed,
    this.isLoading = false,
    this.color = ButtonColor.primary,
    super.key,
  });

  Color backgroundColor(ColorScheme colorScheme) {
    switch (color) {
      case ButtonColor.opaque:
        return colorScheme.background.lighten();
      case ButtonColor.error:
        return colorScheme.errorContainer;
      default:
        return colorScheme.primary;
    }
  }

  Color foregroundColor(ColorScheme colorScheme) {
    switch (color) {
      case ButtonColor.opaque:
        return colorScheme.onBackground;
      case ButtonColor.error:
        return colorScheme.onErrorContainer;
      default:
        return colorScheme.onPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final foreground = foregroundColor(context.theme.colorScheme);
    final background = backgroundColor(context.theme.colorScheme);
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: background,
        disabledBackgroundColor: background.darken(),
        disabledForegroundColor: foreground,
        animationDuration: const Duration(milliseconds: 50),
        enableFeedback: false,
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size.fromHeight(52),
      ),
      child: isLoading
          ? SizedBox(
              height: 26,
              width: 26,
              child: Center(
                child: CircularProgressIndicator(color: foreground),
              ),
            )
          : Text(
              _text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: foreground,
              ),
            ),
    );
  }
}
