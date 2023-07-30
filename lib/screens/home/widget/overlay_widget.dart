import 'package:flutter/material.dart';
import 'overlay_content.dart';

class OverlayWidget extends StatefulWidget {
  final String initialTaskText;
  final bool isEditing;
  final String id;

  const OverlayWidget({
    super.key,
    this.initialTaskText = "",
    this.isEditing = false,
    this.id = "",
  });

  @override
  OverlayWidgetState createState() => OverlayWidgetState();
}

class OverlayWidgetState extends State<OverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.6),
      alignment: Alignment.center,
      child: Center(
        child: OverlayContent(
          isEditing: widget.isEditing,
          initialTaskText: widget.initialTaskText,
          id: widget.id,
        ),
      ),
    );
  }
}
