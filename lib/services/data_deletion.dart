import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<void> deleteData(String id) async {
  try {
    await FirebaseFirestore.instance.collection('todos').doc(id).delete();
  } catch (e) {
    debugPrint("Failed to delete data: $e");
  }
}
