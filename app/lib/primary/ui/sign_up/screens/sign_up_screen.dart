import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

import '../controllers/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  static const route = '/sign-up';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final SignUpController controller;
  late final ReactionDisposer reactionDisposer;

  @override
  void initState() {
    controller = SignUpController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactionDisposer = reaction(
      (_) => controller.status,
      (status) {
        if (status.isSuccess || status.isError) {
          ScaffoldMessenger.of(context).showSnackBar(Toast(
            context: context,
            message: controller.statusMessage,
            type: status.isSuccess ? ToastType.success : ToastType.error,
          ));

          if (status.isSuccess) context.pop();
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
    return Observer(builder: (context) {
      return Scaffold(
        appBar: const TopBar(),
        body: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Spacings.xxxs),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset(Assets.logo, width: 100),
                    const SizedBox(height: Spacings.xxs),
                    const Heading('Sign Up'),
                    const SizedBox(height: Spacings.sm),
                    TextInput(
                      hintText: 'Full name',
                      onChanged: controller.fullName.setValue,
                      errorText: controller.fullName.error,
                      prefixIcon: FeatherIcons.user,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: Spacings.xxxs),
                    TextInput(
                      hintText: 'E-mail',
                      onChanged: controller.email.setValue,
                      errorText: controller.email.error,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: FeatherIconsSnakeCase.mail,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: Spacings.xxxs),
                    PasswordInput(
                      hintText: 'Password',
                      onChanged: controller.password.setValue,
                      errorText: controller.password.error,
                      prefixIcon: FeatherIcons.lock,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: Spacings.xxxs),
                    PasswordInput(
                      hintText: 'Confirm Password',
                      onChanged: controller.confirmPassword.setValue,
                      errorText: controller.confirmPassword.error,
                      prefixIcon: FeatherIcons.lock,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: controller.signUp,
                    ),
                    const SizedBox(height: Spacings.xxs),
                    Button(
                      'Sign up',
                      isLoading: controller.loading,
                      onPressed: controller.signUp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
