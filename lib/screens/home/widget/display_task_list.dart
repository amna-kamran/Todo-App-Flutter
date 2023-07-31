import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widget/no_task_widget.dart';
import 'package:todo_app/screens/home/widget/task_tile.dart';
import 'package:todo_app/services/todo_provider.dart';

TodoProvider todoMethods = TodoProvider();
Widget displayTaskList() {
  return StreamBuilder<QuerySnapshot>(
    stream: todoMethods.fetchTodos(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasData) {
        final taskDocs = snapshot.data!.docs.reversed.toList();

        if (taskDocs.isEmpty) {
          return const NoTasksWidget();
        }

        return ListView.builder(
          itemCount: taskDocs.length,
          itemBuilder: (BuildContext context, int index) {
            final doc = taskDocs[index];
            final String taskText = doc['taskContent'];
            final bool hasCompleted = doc['hasCompleted'];

            return TaskTile(
              hasCompleted: hasCompleted,
              text: taskText,
              id: doc.id,
            );
          },
        );
      } else {
        return const NoTasksWidget();
      }
    },
  );
}
