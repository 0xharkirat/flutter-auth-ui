import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:supabase_auth_ui/src/components/supa_email_auth/supa_email_auth.dart';
import 'package:supabase_auth_ui/src/localizations/supa_email_auth_localization.dart';

class BoolMetaDataFieldWidget extends StatelessWidget {
  const BoolMetaDataFieldWidget(
      {super.key,
      required this.booleanMetaDataField,
      required this.metadataControllers,
      required this.localization});
  final BooleanMetaDataField booleanMetaDataField;
  final Map<String, MetadataController> metadataControllers;
  final SupaEmailAuthLocalization localization;

  @override
  Widget build(BuildContext context) {
    return ShadCheckboxFormField(
      inputLabel: booleanMetaDataField.getLabelWidget(context),
      initialValue: metadataControllers[booleanMetaDataField.key] as bool,
      onChanged: (bool? value) {
        metadataControllers[booleanMetaDataField.key] = value ?? false;
      },
      validator: booleanMetaDataField.isRequired
          ? (bool? value) {
              if (value != true) {
                return localization.requiredFieldError;
              }
              return null;
            }
          : null,
    );
  }
}
