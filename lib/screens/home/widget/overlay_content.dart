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
        child: Card(
          color: const Color.fromARGB(255, 36, 34, 34),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your text',
                    border: OutlineInputBorder(),
                  ),
                ),
                Spaces.h15,
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: isTextFieldEmpty ? null : _handleDoneButtonTap,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      height: 30,
                      width: 70,
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          color: CustomColors.lightGrey,
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
