import 'package:flutter/material.dart';
import 'overlay_content.dart';

class OverlayWidget extends StatefulWidget {
  const OverlayWidget({
    super.key,
  });

  @override
  OverlayWidgetState createState() => OverlayWidgetState();
}

class OverlayWidgetState extends State<OverlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.2),
        alignment: Alignment.center,
        child: Center(
          child: OverlayContent(),
        ),
      ),
    );
  }
}
