import 'package:flutter/material.dart';
import 'package:note_app/ui/utils/utils.dart';
import 'package:note_app/ui/extensions/extensions.dart';

class TextInput extends StatelessWidget {
  final IconData? prefixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;
  final Widget? suffix;
  final String? errorText;

  const TextInput({
    required this.hintText,
    this.initialValue,
    this.prefixIcon,
    this.controller,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onChanged,
    this.textInputAction,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType,
    this.suffix,
    this.errorText,
    super.key,
  });

  InputBorder _buildBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: context.theme.colorScheme.secondary,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      enabled: enabled,
      style: TextStyle(
        color: enabled
            ? context.theme.colorScheme.onSurface
            : context.theme.brightness.name == 'dark'
                ? context.theme.colorScheme.onSurface.darken(45)
                : context.theme.colorScheme.onSurface.lighten(45),
      ),
      decoration: InputDecoration(
        errorText: errorText == null || errorText!.isEmpty ? null : errorText,
        filled: true,
        hintText: hintText,
        disabledBorder: _buildBorder(context),
        enabledBorder: _buildBorder(context),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Spacings.xxxs,
          vertical: 0,
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffix: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
