import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/constants/assets.dart';
import 'package:todo_app/constants/spaces.dart';
import 'package:todo_app/screens/home/widget/task_tile.dart';
import 'package:todo_app/services/todo_provider.dart';
import 'package:todo_app/themes/colors.dart';
part '_no_task_widget.dart';

TodoProvider todoProvider = TodoProvider();

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: todoProvider.fetchTodos(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          final taskDocs = snapshot.data!.docs.reversed.toList();

          if (taskDocs.isEmpty) {
            return const _NoTasksWidget();
          }

          return ListView.builder(
            itemCount: taskDocs.length,
            itemBuilder: (BuildContext context, int index) {
              final doc = taskDocs[index];
              final String taskText = doc['taskContent'];
              final bool hasCompleted = doc['hasCompleted'];

              return TaskTileWidget(
                hasCompleted: hasCompleted,
                text: taskText,
                id: doc.id,
              );
            },
          );
        } else {
          return const _NoTasksWidget();
        }
      },
    );
  }
}
