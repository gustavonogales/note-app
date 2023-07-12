import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

import 'container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp.router(
        title: 'Note App',
        themeMode: locator<GlobalStore>().theme.themeMode,
        theme: ThemeData(
          colorScheme: lightTheme,
          useMaterial3: true,
          textTheme: GoogleFonts.robotoSlabTextTheme(),
        ),
        darkTheme: ThemeData(
          colorScheme: darkTheme,
          useMaterial3: true,
          textTheme: GoogleFonts.robotoSlabTextTheme(),
        ),
        routerConfig: router,
      );
    });
  }
}
