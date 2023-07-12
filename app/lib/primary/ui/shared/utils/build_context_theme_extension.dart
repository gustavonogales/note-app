import 'package:flutter/material.dart';

extension BuildContextThemeExtension on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }
}
