import 'package:flutter/material.dart';
import 'package:todo_app/services/todo_provider.dart';
import 'dialog_widget.dart';

final TodoProvider todoMethods = TodoProvider();

class ShowDialog {
  static void show(
    BuildContext context, {
    final String initialTaskText = "",
    final bool isEditing = false,
    final String id = "",
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDialog(
          isEditing: isEditing,
          initialTaskText: initialTaskText,
          id: id,
        );
      },
    );
  }
}
