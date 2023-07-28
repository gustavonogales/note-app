import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/config/config.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/screens/sign_in/sign_in_screen_controller.dart';

import '../../routes/routes.dart';
import '../../stores/root_store.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  RootStore get store => locator();
  SignInScreenController get controller => store.userStore.signInController;

  @override
  void initState() {
    super.initState();
  }

  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    reactionDisposer = reaction(
      (_) => store.userStore.user,
      (user) {
        if (user != null) {
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
          ScaffoldMessenger.of(context).showSnackBar(
            Toast(
              context: context,
              message: errorText,
              type: ToastType.error,
            ),
          );
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
                        Heading(context.l10n.signIn),
                        const SizedBox(height: Spacings.sm),
                        TextInput(
                          onChanged: controller.email.setValue,
                          errorText: controller.email.error,
                          hintText: context.l10n.email,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: FeatherIconsSnakeCase.mail,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: Spacings.xxxs),
                        PasswordInput(
                          onChanged: controller.password.setValue,
                          errorText: controller.password.error,
                          hintText: context.l10n.password,
                          keyboardType: TextInputType.visiblePassword,
                          prefixIcon: FeatherIcons.lock,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: Spacings.xxs),
                        Button(
                          context.l10n.signIn,
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
                                context.l10n.forgotPassword.toLowerCase(),
                                color: context
                                    .theme.colorScheme.onSecondaryContainer,
                              ),
                            ),
                            TouchableOpacity(
                              onTap: () => context.push(Routes.signUp),
                              child: BodyText(
                                context.l10n.createAnAccount.toLowerCase(),
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
