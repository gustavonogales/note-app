import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RightToLeftTransition extends CustomTransitionPage {
  RightToLeftTransition({
    required Widget child,
  }) : super(
          transitionDuration: const Duration(milliseconds: 200),
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
