// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'overlay_content.dart';

class OverlayEntryWidget extends StatefulWidget {
  const OverlayEntryWidget({
    super.key,
  });

  @override
  _OverlayEntryWidgetState createState() => _OverlayEntryWidgetState();
}

class _OverlayEntryWidgetState extends State<OverlayEntryWidget> {
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
