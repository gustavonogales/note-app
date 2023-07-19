import 'package:flutter/material.dart';

import 'container.dart';
import 'ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies().then(
    (_) => runApp(const NoteApp()),
  );
}
