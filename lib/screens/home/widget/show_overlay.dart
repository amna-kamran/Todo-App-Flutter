import 'package:flutter/material.dart';

import 'overlay_manager.dart';
import 'overlay_widget.dart';

class ShowOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(
    BuildContext context, {
    final String initialTaskText = "",
    final bool isEditing = false,
    final String id = "",
  }) {
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          OverlayManager.removeOverlay();
        },
        child: OverlayWidget(
          initialTaskText: initialTaskText,
          isEditing: isEditing,
          id: id,
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static remove(BuildContext context) {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
