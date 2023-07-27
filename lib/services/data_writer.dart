import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataWriter {
  static final _firestore = FirebaseFirestore.instance;

  DataWriter({
    required this.hasCompleted,
    required this.taskContent,
  });

  final bool hasCompleted;
  final String taskContent;

  Future<void> create() async {
    try {
      final CollectionReference collection = _firestore.collection('todos');

      DateTime timestamp = DateTime.now();
      Map<String, dynamic> data = {
        'hasCompleted': hasCompleted,
        'taskContent': taskContent,
      };

      await collection.doc(timestamp.toString()).set(data);
    } catch (e) {
      debugPrint(e.toString());
      throw ("some error occurred");
    }
  }

  Map<String, dynamic> data = {
    'hasCompleted': false,
    'taskContent': "first task",
  };
}
