import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:note_app/config/config.dart';
import 'package:note_app/ui/routes/routes.dart';

import './stores/root_store.dart';
import './themes/themes.dart';

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  TextTheme? get textTheme => GoogleFonts.robotoSlabTextTheme();
  RootStore get store => locator<RootStore>();
  late final GoRouter routes;

  @override
  void initState() {
    routes = generateRoutes(store.uiStore.navigationKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp.router(
        title: 'Note App',
        themeMode: store.uiStore.themeMode,
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
        routerConfig: routes,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
    });
  }
}
