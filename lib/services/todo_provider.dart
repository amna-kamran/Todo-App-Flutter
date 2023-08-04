import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/auth/auth_provider.dart';

class TodoProvider {
  final _firestore = FirebaseFirestore.instance;

  Future<void> create(Map<String, dynamic> data) async {
    try {
      final CollectionReference collection = _firestore.collection('todos');

      int timestamp = DateTime.now().microsecondsSinceEpoch;
      debugPrint(timestamp.toString());
      await collection.doc(timestamp.toString()).set(data);
    } catch (e) {
      debugPrint(e.toString());
      throw ("some error occurred");
    }
  }

  Future<void> deleteData(String id) async {
    try {
      await _firestore.collection('todos').doc(id).delete();
    } catch (e) {
      debugPrint("Failed to delete data: $e");
    }
  }

  Future<void> updateTask(String id, Map<String, dynamic> payload) async {
    try {
      await _firestore.collection('todos').doc(id).update(payload);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  fetchTodos() {
    return FirebaseFirestore.instance
        .collection('todos')
        .where('user_id', isEqualTo: AuthProvider.getCurrentUserId())
        .snapshots();
  }

  Future<void> storeImgIdwithTaskId(Map<String, dynamic> data) async {
    try {
      final CollectionReference collection = _firestore.collection('images');

      int timestamp = DateTime.now().microsecondsSinceEpoch;
      debugPrint(timestamp.toString());
      await collection.doc(timestamp.toString()).set(data);
    } catch (e) {
      debugPrint(e.toString());
      throw ("some error occurred");
    }
  }
}
