import 'package:flutter/material.dart';
import 'overlay_dialog.dart';

class OverlayWidget extends StatelessWidget {
  final String initialTaskText;
  final bool isEditing;
  final String id;

  const OverlayWidget({
    Key? key,
    this.initialTaskText = "",
    this.isEditing = false,
    this.id = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      alignment: Alignment.center,
      child: Center(
        child: OverlayDialog(
          isEditing: isEditing,
          initialTaskText: initialTaskText,
          id: id,
        ),
      ),
    );
  }
}
