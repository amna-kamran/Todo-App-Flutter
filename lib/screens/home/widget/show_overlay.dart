import 'package:flutter/material.dart';

import 'overlay_manager.dart';
import 'overlay_widget.dart';

class ShowOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          OverlayManager.removeOverlay();
        },
        child: const OverlayWidget(),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static remove(BuildContext context) {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
