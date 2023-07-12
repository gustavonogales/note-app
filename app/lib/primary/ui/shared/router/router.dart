import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/domain/domain.dart';

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
}

final _rootKey = GlobalKey<NavigatorState>();

final _nestedKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: _rootKey,
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
            child: SignUpScreen(),
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
            final id = state.pathParameters['id'];
            final note = state.extra as Note;
            return BottomToTopTransition(
              child: NoteScreen(id!, note),
            );
          },
        ),
      ],
    ),
  ],
);
