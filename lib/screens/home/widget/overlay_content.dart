import 'package:flutter/material.dart';
import 'package:todo_app/Themes/colors.dart';
import 'package:todo_app/constants/spaces.dart';

import '../../../services/data_writer.dart';
import 'overlay_manager.dart';

class OverlayContent extends StatefulWidget {
  OverlayContent({
    Key? key,
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
              padding: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    style: TextStyle(color: CustomColors.textColor),
                    controller: _textFieldController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your text',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 116, 115, 115)),
                      border: InputBorder.none,
                    ),
                  ),
                  Spaces.h15,
                  GestureDetector(
                    onTap: isTextFieldEmpty ? null : _handleDoneButtonTap,
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

  void _handleDoneButtonTap() {
    DataWriter dataWriter = DataWriter(
      hasCompleted: false,
      taskContent: _textFieldController.text,
    );
    dataWriter.create();
    OverlayManager.removeOverlay();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}
