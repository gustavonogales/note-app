import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/ui/shared/shared.dart';

import '../../home/home.dart';
import '../../note/note.dart';
import '../../profile/profile.dart';
import '../../sign_in/sign_in.dart';
import '../../sign_up/sign_up.dart';
import './transitions/bottom_to_top_transition.dart';
import './transitions/right_to_left_transition.dart';

abstract class Routes {
  Routes._();
  static const signIn = SignInScreen.route;
  static const forgotPassword = ForgotPasswordScreen.route;
  static const signUp = SignUpScreen.route;
  static const home = HomeScreen.route;
  static const profile = ProfileScreen.route;
  static const note = NoteScreen.route;
  static const splash = SplashScreen.route;
}

final navigationKey = GlobalKey<NavigatorState>();

final _nestedKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: navigationKey,
  routes: [
    ShellRoute(
      navigatorKey: _nestedKey,
      pageBuilder: (context, state, child) {
        return MaterialPage(
          child: HeroControllerScope(
            controller: MaterialApp.createMaterialHeroController(),
            child: child,
          ),
        );
      },
      routes: [
        GoRoute(
          path: SplashScreen.route,
          pageBuilder: (context, state) => BottomToTopTransition(
            child: const SplashScreen(),
          ),
        ),
        GoRoute(
          path: SignInScreen.route,
          pageBuilder: (context, state) => BottomToTopTransition(
            child: const SignInScreen(),
          ),
        ),
        GoRoute(
          path: ForgotPasswordScreen.route,
          pageBuilder: (context, state) => RightToLeftTransition(
            child: const ForgotPasswordScreen(),
          ),
        ),
        GoRoute(
          path: SignUpScreen.route,
          pageBuilder: (context, state) => RightToLeftTransition(
            child: const SignUpScreen(),
          ),
        ),
        GoRoute(
          path: HomeScreen.route,
          pageBuilder: (context, state) => RightToLeftTransition(
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: ProfileScreen.route,
          pageBuilder: (context, state) => BottomToTopTransition(
            child: const ProfileScreen(),
          ),
        ),
        GoRoute(
          path: '${NoteScreen.route}/:id',
          pageBuilder: (context, state) {
            final note = state.extra as ViewNote;
            return BottomToTopTransition(
              child: NoteScreen(note: note),
            );
          },
        ),
        GoRoute(
          path: NoteScreen.route,
          pageBuilder: (context, state) {
            return BottomToTopTransition(
              child: const NoteScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
