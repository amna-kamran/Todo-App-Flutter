import 'package:flutter/material.dart';

import '../Themes/fi_as3_amna_colors.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _FiA3RohanTextFieldPasswordState();
}

class _FiA3RohanTextFieldPasswordState extends State<PasswordTextField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: TextFormField(
        obscureText: passwordVisible,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 20,
            bottom: 20,
          ),
          fillColor: CustomColors.tileColor,
          filled: true,
          hintText: 'Enter Password',
          hintStyle: const TextStyle(color: CustomColors.mediumGrey),
          suffixIcon: IconButton(
            color: CustomColors.lightGrey,
            icon:
                Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(
                () {
                  passwordVisible = !passwordVisible;
                },
              );
            },
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColors.lightGrey),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
