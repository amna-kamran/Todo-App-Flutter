import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/auth/auth_provider.dart';

class TodoProvider {
  final _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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

      QuerySnapshot imagesSnapshot = await _firestore
          .collection('images')
          .where('taskId', isEqualTo: id)
          .get();

      await Future.wait(imagesSnapshot.docs.map((imageDoc) async {
        try {
          String imgId = imageDoc['imageId'];
          await _firestore.collection('images').doc(imageDoc.id).delete();

          await _storage.ref('images/$imgId').delete();
        } catch (imageDeleteError) {
          debugPrint("Failed to delete image: $imageDeleteError");
        }
      }));
    } catch (deleteError) {
      debugPrint("Failed to delete data: $deleteError");
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
