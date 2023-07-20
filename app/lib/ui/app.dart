import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../container.dart';
import './routes/routes.dart';
import './stores/root_store.dart';
import './themes/themes.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  TextTheme? get textTheme => GoogleFonts.robotoSlabTextTheme();
  RootStore get store => locator<RootStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp.router(
        title: 'Note App',
        themeMode: store.themeStore.themeMode,
        theme: ThemeData(
          colorScheme: lightTheme,
          useMaterial3: true,
          textTheme: textTheme,
        ),
        darkTheme: ThemeData(
          colorScheme: darkTheme,
          useMaterial3: true,
          textTheme: textTheme,
        ),
        routerConfig: router,
      );
    });
  }
}
