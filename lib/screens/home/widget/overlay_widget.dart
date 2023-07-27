import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'overlay_content.dart';

class OverlayEntryWidget extends StatefulWidget {
  final Function(String) onFormSubmit;

  OverlayEntryWidget({required this.onFormSubmit});

  @override
  _OverlayEntryWidgetState createState() => _OverlayEntryWidgetState();
}

class _OverlayEntryWidgetState extends State<OverlayEntryWidget> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: () {
          widget.onFormSubmit(_textEditingController.text);
        },
        child: Container(
          color: Colors.black.withOpacity(0.2),
          alignment: Alignment.center,
          child: Center(
            child: OverlayContent(
              onSubmit: () {
                widget.onFormSubmit(_textEditingController.text);
              },
            ),
          ),
        ),
      ),
    );
  }
}
