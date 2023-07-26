import 'package:flutter/material.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/utils/utils.dart';
import 'package:note_app/ui/widgets/widgets.dart';

class ConfirmDialog extends Dialog {
  final String titleText;
  final String bodyText;
  final Button cancelButton;
  final Button confirmButton;

  const ConfirmDialog({
    required this.titleText,
    required this.bodyText,
    required this.cancelButton,
    required this.confirmButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: context.theme.colorScheme.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      shadowColor: context.theme.colorScheme.background.darken(20),
      backgroundColor: context.theme.colorScheme.background,
      child: Padding(
          padding: const EdgeInsets.all(Spacings.xxxs),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Heading(
                titleText,
                headingSize: HeadingSize.small,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacings.xxxs),
              BodyText(
                bodyText,
                color: context.theme.colorScheme.onSecondaryContainer,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Spacings.xs),
              LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: Column(
                    children: [
                      cancelButton,
                      const SizedBox(height: Spacings.xxxs),
                      confirmButton,
                    ],
                  ),
                );
              }),
            ],
          )),
    );
  }
}
