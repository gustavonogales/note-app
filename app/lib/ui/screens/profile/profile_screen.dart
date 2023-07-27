import 'dart:io';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/utils/utils.dart';
import 'package:note_app/ui/widgets/widgets.dart';

import '../../stores/root_store.dart';
import 'profile_screen_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final RootStore _store;
  late final ProfileScreenController _controller;

  @override
  void initState() {
    _store = locator();
    _controller = ProfileScreenController(_store.userStore);

    super.initState();
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      _controller.setAvatar(File(file.path));
    }
  }

  void _onDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          titleText: 'Delete your account',
          bodyText:
              'Are you sure you want to delete your account?\nThis action is irreversible.',
          cancelButton: Button(
            'Cancel',
            color: ButtonColor.opaque,
            onPressed: Navigator.of(context).pop,
          ),
          confirmButton: Button(
            'Delete',
            color: ButtonColor.error,
            onPressed: () {
              Navigator.of(context).pop();
              _controller.delete();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) => reaction((_) => _controller.messageText, (result) {
        if (result != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            Toast(
              context: context,
              message: result,
              type:
                  _controller.successfull ? ToastType.success : ToastType.error,
            ),
          );
        }
      }),
      child: Observer(builder: (context) {
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
                        ProfileBadge(
                          name: _controller.name.value,
                          file: _controller.avatar,
                          avatar: _store.userStore.user?.avatar,
                          size: 140,
                          onPressed: pickImage,
                        ),
                        const SizedBox(height: Spacings.xxs),
                        Heading(
                          _controller.name.value,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: Spacings.sm),
                        TextInput(
                          initialValue: _controller.name.value,
                          onChanged: _controller.name.setValue,
                          hintText: 'Full name',
                          errorText: _controller.name.error,
                          prefixIcon: FeatherIcons.user,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: Spacings.xxxs),
                        TextInput(
                          initialValue: _controller.email.value,
                          onChanged: _controller.email.setValue,
                          hintText: 'E-mail',
                          errorText: _controller.email.error,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: FeatherIconsSnakeCase.mail,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: Spacings.xxxs),
                        PasswordInput(
                          hintText: 'New Password',
                          onChanged: _controller.password.setValue,
                          errorText: _controller.password.error,
                          prefixIcon: FeatherIcons.lock,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: Spacings.xxxs),
                        PasswordInput(
                          hintText: 'Confirm Password',
                          onChanged: _controller.confirmPassword.setValue,
                          errorText: _controller.confirmPassword.error,
                          prefixIcon: FeatherIcons.lock,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: Spacings.xxs),
                        Button(
                          'Save changes',
                          onPressed: _controller.hasError
                              ? null
                              : _controller.updateProfile,
                        ),
                        const SizedBox(height: Spacings.xl),
                        BodyText(
                          'Version ${_store.appVersion()}',
                          color: context.theme.colorScheme.onSecondaryContainer,
                        ),
                        const SizedBox(height: Spacings.xxxl),
                        TouchableOpacity(
                          onTap: _store.userStore.signOut,
                          child: const BodyText('Sign out'),
                        ),
                        const SizedBox(height: Spacings.xxs),
                        TouchableOpacity(
                          onTap: () => _onDelete(context),
                          child: BodyText(
                            'Delete your account',
                            color: context.theme.colorScheme.error,
                          ),
                        ),
                        const SizedBox(height: Spacings.xxxs),
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
