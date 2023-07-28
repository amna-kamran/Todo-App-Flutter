// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FormWithContainer extends StatefulWidget {
  const FormWithContainer({super.key});

  @override
  _FormWithContainerState createState() {
    return _FormWithContainerState();
  }
}

class _FormWithContainerState extends State<FormWithContainer> {
  final FocusNode _focusNode = FocusNode();
  bool _isFormFieldVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: double.infinity,
        color: Colors.amber,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isFormFieldVisible = !_isFormFieldVisible;
                });

                if (_isFormFieldVisible) {
                  FocusScope.of(context).requestFocus(_focusNode);
                }
              },
              child: Container(
                width: 200,
                height: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text('Tap to Show Form Field'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: _isFormFieldVisible,
              child: TextFormField(
                focusNode: _focusNode,
                decoration: const InputDecoration(
                  labelText: 'Enter your text',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
