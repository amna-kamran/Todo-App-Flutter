import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class MediaProvider {
  static final _storage = FirebaseStorage.instance;
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> uploadImage(File file, String name) async {
    try {
      final ref = _storage.ref("images/$name");
      final uploadTask = ref.putFile(file);

      await uploadTask.whenComplete(() {
        debugPrint("Upload complete");
      });
    } catch (error) {
      debugPrint("Upload error: $error");
    }
  }

  static Future<void> storeImageUrl(String taskId, String imgId) async {
    try {
      final CollectionReference collection = _firestore.collection('images');
      await collection.doc(imgId).set(taskId);
    } catch (e) {
      debugPrint(e.toString());
      throw ("some error occurred");
    }
  }
}
