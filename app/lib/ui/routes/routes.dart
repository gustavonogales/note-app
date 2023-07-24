import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screens.dart';
import './transitions/bottom_to_top_transition.dart';
import './transitions/right_to_left_transition.dart';

abstract class Routes {
  Routes._();
  static const splash = '/';
  static const signIn = '/sign-in';
  static const forgotPassword = '/forgot-password';
  static const signUp = '/sign-up';
  static const home = '/home';
  static const profile = '/profile';
  static const note = '/note';
}

final navigationKey = GlobalKey<NavigatorState>();

final _nestedKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: navigationKey,
  routes: [
    ShellRoute(
      navigatorKey: _nestedKey,
      pageBuilder: (context, state, child) {
        return MaterialPage(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.splash,
          pageBuilder: (context, state) => BottomToTopTransition(
            child: const SplashScreen(),
          ),
        ),
        GoRoute(
          path: Routes.signIn,
          pageBuilder: (context, state) => BottomToTopTransition(
            child: const SignInScreen(),
          ),
        ),
        GoRoute(
          path: Routes.forgotPassword,
          pageBuilder: (context, state) => RightToLeftTransition(
            child: const ForgotPasswordScreen(),
          ),
        ),
        GoRoute(
          path: Routes.signUp,
          pageBuilder: (context, state) => RightToLeftTransition(
            child: const SignUpScreen(),
          ),
        ),
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) => RightToLeftTransition(
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: Routes.profile,
          pageBuilder: (context, state) => BottomToTopTransition(
            child: const ProfileScreen(),
          ),
        ),
        GoRoute(
          path: Routes.note,
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
