import 'package:flutter/material.dart';
import 'package:note_app/ui/extensions/extensions.dart';

enum HeadingSize {
  small(24),
  large(32);

  const HeadingSize(this.fontSize);

  final double fontSize;
}

class Heading extends StatelessWidget {
  final String _text;
  final TextAlign textAlign;
  final HeadingSize headingSize;

  const Heading(
    this._text, {
    this.headingSize = HeadingSize.large,
    this.textAlign = TextAlign.left,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: textAlign,
      style: TextStyle(
        color: context.theme.colorScheme.onBackground,
        fontSize: headingSize.fontSize,
      ),
    );
  }
}
