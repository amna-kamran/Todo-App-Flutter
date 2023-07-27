import 'package:flutter/material.dart';
import 'package:todo_app/Themes/fi_as3_amna_colors.dart';
import 'package:todo_app/constants/fi_as3_amna_spaces.dart';
import 'package:todo_app/core/email_text_field.dart';
import 'package:todo_app/core/password_text_field.dart';

import '../core/button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: Center(
          child: Column(
            children: [
              Spaces.h40,
              Spaces.h40,
              Text(
                "Login Now",
                style: TextStyle(
                    color: CustomColors.textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
              Spaces.h40,
              Spaces.h10,
              EmailTextField(),
              PasswordTextField(),
              Spaces.h10,
              Button(
                color: CustomColors.mediumGrey,
                child: Text("login"),
              ),
            ],
          ),
        ));
  }
}
