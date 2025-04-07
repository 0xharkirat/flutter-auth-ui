import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/src/localizations/supa_email_auth_localization.dart';

class EmailFieldWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  final bool isRecoveringPassword;
  final TextEditingController emailController;
  final SupaEmailAuthLocalization localization;
  final Widget? prefixIconEmail;
  final VoidCallback passwordRecovery;
  final bool shadcnStyle;

  const EmailFieldWidget({
    super.key,
    required this.emailFocusNode,
    required this.isRecoveringPassword,
    required this.emailController,
    required this.localization,
    required this.prefixIconEmail,
    required this.passwordRecovery,
    this.shadcnStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return shadcnStyle
        ? ShadInputFormField(
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: true,
            focusNode: emailFocusNode,
            textInputAction: isRecoveringPassword
                ? TextInputAction.done
                : TextInputAction.next,
            validator: (value) {
              if (value.isEmpty ||
                  !EmailValidator.validate(emailController.text)) {
                return localization.validEmailError;
              }
              return null;
            },
            decoration: const ShadDecoration(),
            leading: prefixIconEmail ?? const Icon(LucideIcons.mail),
            label: Text(localization.enterEmail),
            placeholder: Text(localization.placeholderEmail),
            controller: emailController,
            onSubmitted: (_) {
              if (isRecoveringPassword) {
                passwordRecovery();
              }
            },
          )
        : TextFormField(
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: true,
            focusNode: emailFocusNode,
            textInputAction: isRecoveringPassword
                ? TextInputAction.done
                : TextInputAction.next,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !EmailValidator.validate(emailController.text)) {
                return localization.validEmailError;
              }
              return null;
            },
            decoration: InputDecoration(
              prefixIcon: prefixIconEmail,
              label: Text(localization.enterEmail),
            ),
            controller: emailController,
            onFieldSubmitted: (_) {
              if (isRecoveringPassword) {
                passwordRecovery();
              }
            },
          );
  }
}
