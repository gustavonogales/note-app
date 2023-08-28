import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/utils/utils.dart';
import 'package:note_app/ui/widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
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
            child: Center(
              child: Container(
                width: maxContainerWidth,
                padding: const EdgeInsets.all(Spacings.xxxs),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Heading(context.l10n.forgotPassword),
                      const SizedBox(height: Spacings.xxs),
                      BodyText(
                        context.l10n.forgotPasswordDescription,
                        textAlign: TextAlign.center,
                        color: context.theme.colorScheme.onSecondaryContainer,
                      ),
                      const SizedBox(height: Spacings.xxs),
                      TextInput(
                        hintText: context.l10n.email,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: FeatherIconsSnakeCase.mail,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: Spacings.xxs),
                      Button(
                        context.l10n.send,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
