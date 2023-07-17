import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/primary/ui/shared/shared.dart';
import 'package:note_app/primary/ui/shared/stores/auth_store.dart';

import '../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  static const route = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final AuthStore store;
  late final ProfileController controller;
  late final ReactionDisposer loggedInDisposer;
  late final ReactionDisposer userChangedDisposer;

  @override
  void initState() {
    store = locator<GlobalStore>().auth;
    controller = ProfileController(store.user);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loggedInDisposer = reaction(
      (_) => store.isLoggedIn,
      (isLoggedIn) {
        if (!isLoggedIn) {
          context.go(Routes.signIn);
        }
      },
    );

    userChangedDisposer = reaction((_) => controller.messageText, (result) {
      if (result != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          Toast(
            context: context,
            message: result,
            type: controller.successfull ? ToastType.success : ToastType.error,
          ),
        );

        if (controller.successfull) {
          store.setUser(controller.user!);
        }
      }
    });
  }

  @override
  void dispose() {
    loggedInDisposer();
    userChangedDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: const TopBar(),
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(Spacings.xxxs),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileBadge(
                      name: controller.name.value,
                      avatarUrl: store.user?.avatarUrl,
                      size: 140,
                      onPressed: () {},
                    ),
                    const SizedBox(height: Spacings.xxs),
                    Heading(
                      controller.name.value,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Spacings.sm),
                    TextInput(
                      initialValue: controller.name.value,
                      onChanged: controller.name.setValue,
                      hintText: 'Full name',
                      errorText: controller.name.error,
                      prefixIcon: FeatherIcons.user,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: Spacings.xxxs),
                    TextInput(
                      initialValue: store.user?.email ?? '',
                      onChanged: controller.email.setValue,
                      hintText: 'E-mail',
                      errorText: controller.email.error,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: FeatherIconsSnakeCase.mail,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: Spacings.xxxs),
                    PasswordInput(
                      hintText: 'New Password',
                      onChanged: controller.password.setValue,
                      errorText: controller.password.error,
                      prefixIcon: FeatherIcons.lock,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: Spacings.xxxs),
                    PasswordInput(
                      hintText: 'Confirm Password',
                      onChanged: controller.confirmPassword.setValue,
                      errorText: controller.confirmPassword.error,
                      prefixIcon: FeatherIcons.lock,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: Spacings.xxs),
                    Button(
                      'Save changes',
                      onPressed:
                          controller.hasError ? null : controller.updateProfile,
                    ),
                    const SizedBox(height: Spacings.xl),
                    BodyText(
                      'Version 0.0.1',
                      color: context.theme.colorScheme.onSecondaryContainer,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(Spacings.xxxs),
                child: Center(
                  child: TouchableOpacity(
                    onTap: store.signOut,
                    child: const BodyText('Sair'),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
