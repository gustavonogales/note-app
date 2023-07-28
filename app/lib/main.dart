import 'package:flutter/material.dart';
import 'package:note_app/config/config.dart';

import 'ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies().then(
    (_) => runApp(const NoteApp()),
  );
}
