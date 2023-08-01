import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/services/auth_provider.dart';
import 'package:todo_app/services/todo_provider.dart';
import '../constants/assets.dart';
import '../constants/spaces.dart';
import '../themes/colors.dart';

final TodoProvider todoMethods = TodoProvider();

class ShowDialog {
  static void show(
    BuildContext context, {
    final String initialTaskText = "",
    final bool isEditing = false,
    final String id = "",
  }) {
    final TextEditingController textFieldController =
        TextEditingController(text: initialTaskText);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: CustomColors.accent,
          content: Row(
            children: [
              SvgPicture.asset(
                Assets.boxSvg,
                height: 25,
                width: 25,
              ),
              Spaces.w20,
              Expanded(
                child: TextFormField(
                  style: const TextStyle(color: CustomColors.white),
                  controller: textFieldController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your text',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 116, 115, 115),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Spaces.h15,
              GestureDetector(
                onTap: () {
                  isEditing
                      ? todoMethods.updateTask(id, {
                          'taskContent': textFieldController.text,
                        })
                      : todoMethods.create({
                          'hasCompleted': false,
                          'taskContent': textFieldController.text,
                          'user_id': AuthProvider.getCurrentUserId(),
                        });

                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: 60,
                  width: 90,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    height: 30,
                    width: 70,
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: textFieldController.text == ""
                            ? CustomColors.lightGrey
                            : CustomColors.yellow,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
