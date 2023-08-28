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

GoRouter generateRoutes(GlobalKey<NavigatorState> navigationKey) {
  return GoRouter(
    navigatorKey: navigationKey,
    routes: [
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        pageBuilder: (_, __, child) {
          return MaterialPage(child: child);
        },
        routes: [
          GoRoute(
            path: Routes.splash,
            pageBuilder: (_, __) => BottomToTopTransition(
              child: const SplashScreen(),
            ),
          ),
          GoRoute(
            path: Routes.signIn,
            pageBuilder: (_, __) => BottomToTopTransition(
              child: const SignInScreen(),
            ),
          ),
          GoRoute(
            path: Routes.forgotPassword,
            pageBuilder: (_, __) => RightToLeftTransition(
              child: const ForgotPasswordScreen(),
            ),
          ),
          GoRoute(
            path: Routes.signUp,
            pageBuilder: (_, __) => RightToLeftTransition(
              child: const SignUpScreen(),
            ),
          ),
          GoRoute(
            path: Routes.home,
            pageBuilder: (_, __) => RightToLeftTransition(
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: Routes.profile,
            pageBuilder: (_, __) => BottomToTopTransition(
              child: const ProfileScreen(),
            ),
          ),
          GoRoute(
            path: Routes.note,
            pageBuilder: (_, __) => BottomToTopTransition(
              child: const NoteScreen(),
            ),
          ),
        ],
      ),
    ],
  );
}
