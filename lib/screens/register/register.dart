import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:todo_app/constants/spaces.dart';
import 'package:todo_app/core/form_builder_widget.dart';
import 'package:todo_app/services/auth_provider.dart';
import 'package:todo_app/themes/colors.dart';

part 'widget/_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}
