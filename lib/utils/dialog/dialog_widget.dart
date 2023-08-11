import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/constants/assets.dart';
import 'package:todo_app/constants/spaces.dart';
import 'package:todo_app/services/auth/auth_provider.dart';
import 'package:todo_app/services/media/data_provider.dart';
import 'package:todo_app/services/todo_provider.dart';
import 'package:todo_app/themes/colors.dart';

class TaskDialog extends StatefulWidget {
  final bool isEditing;
  final String id;
  final String initialTaskText;

  const TaskDialog({
    Key? key,
    required this.isEditing,
    required this.id,
    required this.initialTaskText,
  }) : super(key: key);

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final TodoProvider todoProvider = TodoProvider();
  final TextEditingController textFieldController = TextEditingController();
  File? pickedImage;

  @override
  void initState() {
    super.initState();
    textFieldController.text = widget.initialTaskText;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.accent,
      content: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
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
                      maxLines: null,
                      onChanged: (value) {
                        setState(() {});
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
                ],
              ),
              if (widget.isEditing && pickedImage != null)
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.file(
                    pickedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              if (widget.isEditing)
                GestureDetector(
                  onTap: () async {
                    final FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      final File file = File(result.files.single.path!);
                      setState(() {
                        pickedImage = file;
                      });
                      final timeStamp =
                          DateTime.now().microsecondsSinceEpoch.toString();

                      await MediaProvider.uploadImage(file, timeStamp);
                      MediaProvider.storeImageUrl(widget.id, timeStamp);

                      todoProvider.storeImgIdwithTaskId(
                        {'imageId': timeStamp, 'taskId': widget.id},
                      );
                    } else {
                      debugPrint("no file picked");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (pickedImage != null)
                          Image.file(
                            pickedImage!,
                            height: 35,
                            width: 35,
                          ),
                        Spaces.w10,
                        const Icon(
                          Icons.add_photo_alternate_outlined,
                          color: CustomColors.darkGrey,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.isEditing) {
                        todoProvider.updateTask(
                          widget.id,
                          {
                            'taskContent': textFieldController.text,
                          },
                        );
                      } else {
                        todoProvider.create(
                          {
                            'hasCompleted': false,
                            'taskContent': textFieldController.text,
                            'user_id': AuthProvider.getCurrentUserId(),
                          },
                        );
                      }

                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      height: 40,
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
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
