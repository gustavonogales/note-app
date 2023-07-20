import 'package:flutter/material.dart';

extension BuildContextSizeExtension on BuildContext {
  Size get size {
    return MediaQuery.of(this).size;
  }
}
