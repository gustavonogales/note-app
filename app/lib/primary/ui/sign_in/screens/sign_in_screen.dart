import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

import '../controller/sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  static const String route = '/';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final controller = SignInController();
  GlobalStore get globalStore => locator();

  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    reactionDisposer = reaction(
      (_) => controller.user,
      (user) {
        if (user != null) {
          globalStore.auth.setUser(user);
          context.go(Routes.home);
        }
      },
    );
  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) => reaction((_) => controller.errorText, (errorText) {
        if (errorText != null) {
          ScaffoldMessenger.of(context).showSnackBar(Toast(
            context: context,
            message: errorText,
            type: ToastType.error,
          ));
        }
      }),
      child: Observer(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
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
                        const SizedBox(height: Spacings.sm),
                        SvgPicture.asset(Assets.logo, width: 100),
                        const SizedBox(height: Spacings.xxs),
                        const Heading('Sign In'),
                        const SizedBox(height: Spacings.sm),
                        TextInput(
                          onChanged: controller.email.setValue,
                          errorText: controller.email.error,
                          hintText: 'E-mail',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: FeatherIconsSnakeCase.mail,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: Spacings.xxxs),
                        PasswordInput(
                          onChanged: controller.password.setValue,
                          errorText: controller.password.error,
                          hintText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: FeatherIcons.lock,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: Spacings.xxs),
                        Button(
                          'Sign in',
                          isLoading: controller.loading,
                          onPressed: () => controller.signIn(),
                        ),
                        const SizedBox(height: Spacings.xxs),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TouchableOpacity(
                              onTap: () => context.push(Routes.forgotPassword),
                              child: BodyText(
                                'forgot password',
                                color: context
                                    .theme.colorScheme.onSecondaryContainer,
                              ),
                            ),
                            TouchableOpacity(
                              onTap: () => context.push(Routes.signUp),
                              child: BodyText(
                                'create an account',
                                color: context
                                    .theme.colorScheme.onSecondaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
