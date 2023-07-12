import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Spinner extends StatelessWidget {
  const Spinner({super.key});

  @override
  Widget build(BuildContext context) {
    return !Platform.isIOS
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator();
  }
}
