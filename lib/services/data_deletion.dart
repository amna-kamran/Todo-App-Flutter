import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> deleteData(id) async {
  return FirebaseFirestore.instance
      .collection('todos')
      .doc(id)
      .delete()
      .catchError(
        (error) => debugPrint("Failed to update user: $error"),
      );
}
