import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:note_app/ui/widgets/widgets.dart';

class PasswordInput extends StatefulWidget {
  final IconData? prefixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final bool enabled;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final String? errorText;

  const PasswordInput({
    required this.hintText,
    this.initialValue,
    this.prefixIcon,
    this.controller,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onChanged,
    this.textInputAction,
    this.enabled = true,
    this.keyboardType,
    this.errorText,
    super.key,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextInput(
      errorText: widget.errorText,
      onEditingComplete: widget.onEditingComplete,
      hintText: widget.hintText,
      initialValue: widget.initialValue,
      prefixIcon: widget.prefixIcon,
      controller: widget.controller,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      obscureText: obscureText,
      keyboardType: widget.keyboardType,
      suffix: TouchableOpacity(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: Icon(
          obscureText ? FeatherIcons.eye : FeatherIcons.eyeOff,
        ),
      ),
    );
  }
}
