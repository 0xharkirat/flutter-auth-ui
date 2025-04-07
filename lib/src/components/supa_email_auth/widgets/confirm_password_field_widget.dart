import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/src/localizations/supa_email_auth_localization.dart';

class ConfirmPasswordFieldWidget extends StatelessWidget {
  const ConfirmPasswordFieldWidget(
      {super.key,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.localization,
      this.prefixIconPassword,
      this.shadcnStyle = false});
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final SupaEmailAuthLocalization localization;
  final Widget? prefixIconPassword;
  final bool? shadcnStyle;

  @override
  Widget build(BuildContext context) {
    return shadcnStyle == true
        ? ShadInputFormField(
            controller: confirmPasswordController,
            decoration: const ShadDecoration(),
            leading: prefixIconPassword ?? const Icon(LucideIcons.lock),
            label: Text(localization.confirmPassword),
            obscureText: true,
            validator: (value) {
              if (value != passwordController.text) {
                return localization.confirmPasswordError;
              }
              return null;
            },
          )
        :
     TextFormField(
      controller: confirmPasswordController,
      decoration: InputDecoration(
        prefixIcon: prefixIconPassword,
        label: Text(localization.confirmPassword),
      ),
      obscureText: true,
      validator: (value) {
        if (value != passwordController.text) {
          return localization.confirmPasswordError;
        }
        return null;
      },
    );
  }
}
