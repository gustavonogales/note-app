import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../container.dart';
import '../routes/routes.dart';
import '../stores/user_store.dart';
import '../stores/root_store.dart';
import '../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final UserStore userStore;

  @override
  void initState() {
    userStore = locator<RootStore>().userStore;
    _redirect();
    super.initState();
  }

  Future<void> _redirect() async {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      context.go(userStore.isSignedIn ? Routes.home : Routes.signIn);
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
