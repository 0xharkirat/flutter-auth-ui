import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/src/components/supa_email_auth/supa_email_auth.dart';
import 'package:supabase_auth_ui/src/localizations/supa_email_auth_localization.dart';

class PasswordFieldWidget extends StatelessWidget {
  const PasswordFieldWidget(
      {super.key,
      this.metadataFields,
      required this.isSigningIn,
      this.passwordValidator,
      required this.localization,
      this.prefixIconPassword,
      required this.shadcnStyle,
      required this.passwordController,
      required this.signInSignUp});
  final List<MetaDataField>? metadataFields;
  final bool isSigningIn;
  final String? Function(String?)? passwordValidator;
  final SupaEmailAuthLocalization localization;
  final Widget? prefixIconPassword;
  final bool? shadcnStyle;
  final TextEditingController passwordController;
  final VoidCallback signInSignUp;

  @override
  Widget build(BuildContext context) {
    return shadcnStyle == true
        ? ShadInputFormField(
            autofillHints: isSigningIn
                ? const [AutofillHints.password]
                : const [AutofillHints.newPassword],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: metadataFields != null && !isSigningIn
                ? TextInputAction.next
                : TextInputAction.done,
            validator: passwordValidator ??
                (value) {
                  if (value.isEmpty || value.length < 6) {
                    return localization.passwordLengthError;
                  }
                  return null;
                },
            decoration: const ShadDecoration(),
            leading: prefixIconPassword ?? const Icon(LucideIcons.lock),
            label: Text(localization.enterPassword),
            obscureText: true,
            controller: passwordController,
            onSubmitted: (_) {
              if (metadataFields == null || isSigningIn) {
                signInSignUp();
              }
            },
          )
        : TextFormField(
            autofillHints: isSigningIn
                ? [AutofillHints.password]
                : [AutofillHints.newPassword],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: metadataFields != null && !isSigningIn
                ? TextInputAction.next
                : TextInputAction.done,
            validator: passwordValidator ??
                (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return localization.passwordLengthError;
                  }
                  return null;
                },
            decoration: InputDecoration(
              prefixIcon: prefixIconPassword,
              label: Text(localization.enterPassword),
            ),
            obscureText: true,
            controller: passwordController,
            onFieldSubmitted: (_) {
              if (metadataFields == null || isSigningIn) {
                signInSignUp();
              }
            },
          );
  }
}
