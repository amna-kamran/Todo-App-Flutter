import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/constants/assets.dart';
import 'package:todo_app/constants/spaces.dart';
import 'package:todo_app/services/auth_provider.dart';
import 'package:todo_app/themes/colors.dart';
import 'package:todo_app/utils/dialog/show_dialog.dart';

class TaskDialog extends StatelessWidget {
  final bool isEditing;
  final String id;
  final initialTaskText;

  const TaskDialog({
    super.key,
    required this.isEditing,
    required this.id,
    required this.initialTaskText,
  });
  @override
  Widget build(BuildContext context) {
    final TextEditingController textFieldController =
        TextEditingController(text: initialTaskText);

    return AlertDialog(
      backgroundColor: CustomColors.accent,
      content: StatefulBuilder(
        builder: (context, setState) {
          return Row(
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
                  onChanged: (value) {
                    setState(() {}); // This line is necessary to rebuild the UI
                  },
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
                  if (isEditing) {
                    todoMethods.updateTask(
                      id,
                      {
                        'taskContent': textFieldController.text,
                      },
                    );
                  } else {
                    todoMethods.create(
                      {
                        'hasCompleted': false,
                        'taskContent': textFieldController.text,
                        'user_id': AuthProvider.getCurrentUserId(),
                      },
                    );
                  }

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
                        color: textFieldController.text.isEmpty
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
          );
        },
      ),
    );
  }
}
