import 'package:flutter/material.dart';

import 'container.dart';
import 'primary/ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies().then(
    (_) => runApp(const NoteApp()),
  );
}
