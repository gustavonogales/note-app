import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/ui/shared/shared.dart';

import '../../../../container.dart';
import '../stores/auth_store.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AuthStore authStore;

  @override
  void initState() {
    authStore = locator<GlobalStore>().auth;

    _redirect();
    super.initState();
  }

  Future<void> _redirect() async {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      context.go(authStore.isSignedIn ? Routes.home : Routes.signIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.logo,
              width: size.width / 3,
            ),
            const SizedBox(height: Spacings.lg),
            const CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
