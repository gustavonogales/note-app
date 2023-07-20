import 'package:flutter/material.dart';
import 'package:note_app/ui/extensions/extensions.dart';

class Button extends StatelessWidget {
  final String _text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const Button(
    this._text, {
    this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: FilledButton.styleFrom(
        disabledBackgroundColor: context.theme.colorScheme.primary.darken(),
        disabledForegroundColor: context.theme.colorScheme.onPrimary,
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
                child: CircularProgressIndicator(
                  color: context.theme.colorScheme.onPrimary,
                ),
              ),
            )
          : Text(
              _text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
