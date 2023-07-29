import 'package:flutter/material.dart';
import 'package:todo_app/Themes/colors.dart';
import 'package:todo_app/constants/spaces.dart';

import '../../../services/data_writer.dart';
import 'overlay_manager.dart';

class OverlayContent extends StatelessWidget {
  OverlayContent({
    super.key,
  });
  final TextEditingController _textFieldController = TextEditingController();
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
                    onTap: () {
                      DataWriter dataWriter = DataWriter(
                          hasCompleted: false,
                          taskContent: _textFieldController.text);
                      dataWriter.create();
                      OverlayManager.removeOverlay();
                    },
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
}
