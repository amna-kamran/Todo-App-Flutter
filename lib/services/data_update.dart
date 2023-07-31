import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> updateCompletedField(id, hasCompleted) async {
  return FirebaseFirestore.instance
      .collection('todos')
      .doc(id)
      .update({'hasCompleted': hasCompleted})
      .then((value) => debugPrint("bool updated"))
      .catchError(
        (error) => debugPrint("Failed to update bool: $error"),
      );
}

Future<void> updateTaskContent(id, taskContent) async {
  return await FirebaseFirestore.instance
      .collection('todos')
      .doc(id)
      .update({'taskContent': taskContent})
      .then((value) => debugPrint("task updated"))
      .catchError(
        (error) => debugPrint("Failed to update task: $error"),
      );
}
