import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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

  static Stream<List<String>> fetchImgURLs(String taskId) {
    final imageURLsSubject = BehaviorSubject<List<String>>();

    _firestore
        .collection('images')
        .where('taskId', isEqualTo: taskId)
        .snapshots()
        .listen((snapshot) async {
      final imageURLs = <String>[];

      for (final doc in snapshot.docs) {
        final imgId = doc['imageId'];
        final ref = _storage.ref("images/$imgId");
        final url = await ref.getDownloadURL();
        imageURLs.add(url);
      }

      imageURLsSubject.add(imageURLs);
    }, onError: (error) {
      debugPrint("Fetch image URLs error: $error");
    });

    return imageURLsSubject.stream;
  }
}
