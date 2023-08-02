import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_app/themes/colors.dart';

enum FieldType {
  text,
  password,
  email,
  pincode,
  username,
  phoneNumber,
}

class AppInputTextField extends StatelessWidget {
  final String labelText;
  final FieldType fieldType;
  final int? minLength;
  final int? maxLength;

  AppInputTextField({
    Key? key,
    required this.labelText,
    required this.fieldType,
    this.minLength,
    this.maxLength,
  }) : super(key: key) {
    assert(
      fieldType != FieldType.password ||
          (minLength != null && maxLength != null),
      'For password input type, you must provide both minLength and maxLength.',
    );

    assert(
      fieldType != FieldType.pincode ||
          (minLength != null && maxLength != null),
      'For pincode input type, you must provide both minLength and maxLength.',
    );
  }

  @override
  Widget build(BuildContext context) {
    bool obscureText =
        fieldType == FieldType.password || fieldType == FieldType.pincode;
    bool isEmail = fieldType == FieldType.email;

    return FormBuilderTextField(
      name: labelText,
      obscureText: obscureText,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: CustomColors.mediumGrey,
        ),
        filled: true,
        fillColor: CustomColors.accent,
      ),
      style: const TextStyle(color: CustomColors.mediumGrey),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(),
          if (minLength != null && obscureText)
            FormBuilderValidators.minLength(minLength!),
          if (maxLength != null) FormBuilderValidators.maxLength(maxLength!),
          if (!obscureText && isEmail) FormBuilderValidators.email(),
        ],
      ),
    );
  }
}
