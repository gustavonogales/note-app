import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/primary/ui/shared/shared.dart';
import 'package:note_app/primary/ui/shared/stores/auth_store.dart';

class ProfileScreen extends StatefulWidget {
  static const route = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthStore get store => locator<GlobalStore>().auth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    reaction(
      (_) => store.isLoggedIn,
      (isLoggedIn) {
        if (!isLoggedIn) {
          context.go(Routes.signIn);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ScreenTemplate(
        appBar: const TopBar(),
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileBadge(
                    name: store.user?.name ?? '',
                    avatarUrl: store.user?.avatarUrl,
                    size: 140,
                    onPressed: () {},
                  ),
                  const SizedBox(height: Spacings.xxs),
                  Heading(
                    store.user!.name,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacings.sm),
                  TextInput(
                    initialValue: store.user?.name ?? '',
                    enabled: false,
                    hintText: 'Full name',
                    prefixIcon: FeatherIcons.user,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: Spacings.xxxs),
                  TextInput(
                    initialValue: store.user?.email ?? '',
                    hintText: 'E-mail',
                    enabled: false,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: FeatherIconsSnakeCase.mail,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: Spacings.xxxs),
                  const PasswordInput(
                    hintText: 'New Password',
                    prefixIcon: FeatherIcons.lock,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: Spacings.xxxs),
                  const PasswordInput(
                    hintText: 'Confirm Password',
                    prefixIcon: FeatherIcons.lock,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: Spacings.xxs),
                  Button('Save changes', onPressed: () {}),
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
