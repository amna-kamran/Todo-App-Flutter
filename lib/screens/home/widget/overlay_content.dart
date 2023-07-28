import 'package:flutter/material.dart';

import '../../../services/data_writer.dart';

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
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _textFieldController,
                  decoration: const InputDecoration(
                    labelText: 'Enter your text',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    //have to check if the id already exists, if it doesnt then datawriter will get called otherwise dataupdate will be called
                    DataWriter dataWriter = DataWriter(
                        hasCompleted: false,
                        taskContent: _textFieldController.text);
                    await dataWriter.create();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
