import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> updateCompletedField(id, hasCompleted) async {
  return FirebaseFirestore.instance
      .collection('todos')
      .doc(id)
      .update({'hasCompleted': hasCompleted})
      .then((value) => debugPrint("bool updated"))
      .catchError(
        (error) => debugPrint("Failed to update user: $error"),
      );
}
