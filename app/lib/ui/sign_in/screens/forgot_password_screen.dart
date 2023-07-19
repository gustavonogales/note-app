import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:note_app/ui/shared/shared.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const route = '/forgot-password';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
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
                    const Heading('Forgot password'),
                    const SizedBox(height: Spacings.xxs),
                    BodyText(
                      'We’ll send you a link and a guide to recovery your password',
                      textAlign: TextAlign.center,
                      color: context.theme.colorScheme.onSecondaryContainer,
                    ),
                    const SizedBox(height: Spacings.xxs),
                    const TextInput(
                      hintText: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: FeatherIconsSnakeCase.mail,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: Spacings.xxs),
                    Button(
                      'Send',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
