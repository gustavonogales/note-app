import 'package:flutter/material.dart';
import 'package:note_app/ui/extensions/extensions.dart';

class Heading extends StatelessWidget {
  final String _text;
  final TextAlign textAlign;

  const Heading(this._text, {this.textAlign = TextAlign.left, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: textAlign,
      style: TextStyle(
        color: context.theme.colorScheme.onBackground,
        fontSize: 32,
      ),
    );
  }
}
