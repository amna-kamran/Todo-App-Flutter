import 'package:flutter/material.dart';
import 'package:todo_app/Themes/fi_as3_amna_colors.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 20,
            top: 20,
            bottom: 20,
          ),
          fillColor: CustomColors.tileColor,
          filled: true,
          hintText: 'Enter Email',
          hintStyle: const TextStyle(color: CustomColors.mediumGrey),
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
