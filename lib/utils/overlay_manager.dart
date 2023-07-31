import 'package:flutter/material.dart';
import 'package:todo_app/utils/show_overlay.dart';

BuildContext? storedContext;

class OverlayManager {
  static void storeContext(BuildContext context) {
    storedContext = context;
  }

  static void removeOverlay() {
    ShowOverlay.remove(storedContext!);
  }
}
