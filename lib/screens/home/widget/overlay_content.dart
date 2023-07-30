import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/themes/colors.dart';
import 'package:todo_app/constants/spaces.dart';
import 'package:todo_app/utils/assets.dart';

import '../../../services/data_update.dart';
import '../../../services/data_writer.dart';
import 'overlay_manager.dart';

class OverlayContent extends StatefulWidget {
  final String initialTaskText;
  final bool isEditing;
  final String id;

  const OverlayContent({
    Key? key,
    this.initialTaskText = "",
    this.isEditing = false,
    this.id = "",
  }) : super(key: key);

  @override
  OverlayContentState createState() => OverlayContentState();
}

class OverlayContentState extends State<OverlayContent> {
  final TextEditingController _textFieldController = TextEditingController();
  bool isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();

    _textFieldController.text = widget.isEditing ? widget.initialTaskText : '';

    _textFieldController.addListener(_handleTextFieldChange);
  }

  void _handleTextFieldChange() {
    setState(() {
      isTextFieldEmpty = _textFieldController.text.trim().isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Card(
            color: const Color.fromARGB(255, 36, 34, 34),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                // Use Row instead of Column
                children: [
                  SvgPicture.asset(
                    Assets.boxSvg,
                    height: 25,
                    width: 25,
                  ),
                  Spaces.w20,
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: CustomColors.textColor),
                      controller: _textFieldController,
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
                      widget.isEditing ? taskUpdation() : newTaskCreation();
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
                            color: isTextFieldEmpty
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
            ),
          ),
        ),
      ),
    );
  }

  void newTaskCreation() {
    DataWriter dataWriter = DataWriter(
      hasCompleted: false,
      taskContent: _textFieldController.text,
    );
    dataWriter.create();
    OverlayManager.removeOverlay();
  }

  void taskUpdation() {
    updateTaskContent(
      widget.id,
      _textFieldController.text,
    );

    OverlayManager.removeOverlay();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}
