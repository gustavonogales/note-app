import 'package:flutter/material.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

class BodyText extends StatelessWidget {
  final String _text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const BodyText(
    this._text, {
    this.color,
    this.textAlign,
    this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? context.theme.colorScheme.onBackground,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: 16,
      ),
    );
  }
}
