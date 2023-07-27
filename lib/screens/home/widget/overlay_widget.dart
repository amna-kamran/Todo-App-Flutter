// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../../services/data_writer.dart';
import 'overlay_content.dart';

class OverlayEntryWidget extends StatefulWidget {
  final Function(String) onFormSubmit;

  const OverlayEntryWidget({super.key, required this.onFormSubmit});

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
