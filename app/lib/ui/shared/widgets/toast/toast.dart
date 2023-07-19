import 'package:flutter/material.dart';
import 'package:note_app/ui/shared/shared.dart';

enum ToastType {
  error,
  success;
}

class Toast extends SnackBar {
  Toast({
    required BuildContext context,
    required String message,
    required ToastType type,
    Duration duration = const Duration(seconds: 3),
    Key? key,
  }) : super(
          key: key,
          padding: const EdgeInsets.symmetric(
            vertical: Spacings.nano,
            horizontal: Spacings.xxxs,
          ),
          content: Text(message, style: const TextStyle(color: Colors.white)),
          showCloseIcon: true,
          closeIconColor: Colors.white,
          duration: duration,
          backgroundColor: type == ToastType.error
              ? context.theme.colorScheme.errorContainer
              : context.theme.colorScheme.primaryContainer,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(Spacings.xxxs),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
}
