import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/src/components/supa_email_auth/supa_email_auth.dart';

class MetaDataFieldWidget extends StatelessWidget {
  const MetaDataFieldWidget(
      {super.key,
      required this.metadataControllers,
      required this.metadataField,
      this.metadataFields,
      required this.signInSignUp,
      this.shadcnStyle = false,
      required this.previousContext});
  final Map<String, MetadataController> metadataControllers;
  final MetaDataField metadataField;
  final List<MetaDataField>? metadataFields;
  final VoidCallback signInSignUp;
  final bool? shadcnStyle;
  final BuildContext previousContext;

  @override
  Widget build(BuildContext context) {
    return shadcnStyle == true
        ? ShadInputFormField(
            controller:
                metadataControllers[metadataField.key] as TextEditingController,
            textInputAction: metadataFields!.last == metadataField
                ? TextInputAction.done
                : TextInputAction.next,
            decoration: const ShadDecoration(),
            label: Text(metadataField.label),
            leading: metadataField.prefixIcon,
            validator: metadataField.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onSubmitted: (_) {
              if (metadataField != metadataFields!.last) {
                FocusScope.of(context).nextFocus();
              } else {
                signInSignUp();
              }
            },
          )
        : TextFormField(
            controller:
                metadataControllers[metadataField.key] as TextEditingController,
            textInputAction: metadataFields!.last == metadataField
                ? TextInputAction.done
                : TextInputAction.next,
            decoration: InputDecoration(
              label: Text(metadataField.label),
              prefixIcon: metadataField.prefixIcon,
            ),
            validator: metadataField.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (_) {
              if (metadataField != metadataFields!.last) {
                FocusScope.of(previousContext).nextFocus();
              } else {
                signInSignUp();
              }
            },
          );
  }
}
