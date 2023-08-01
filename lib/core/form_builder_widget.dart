import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_app/themes/colors.dart';

Widget buildFormBuilderTextField(
    String name, String labelText, bool obscureText) {
  return FormBuilderTextField(
    name: name,
    obscureText: obscureText,
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
        if (obscureText) FormBuilderValidators.minLength(6),
        if (!obscureText && name == "email") FormBuilderValidators.email(),
      ],
    ),
  );
}
