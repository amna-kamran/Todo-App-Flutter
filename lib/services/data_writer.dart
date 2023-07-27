import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; // Import the cloud_firestore package

class DataWriter {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> create() async {
    try {
      final CollectionReference collection =
          FirebaseFirestore.instance.collection('todos');

      Map<String, dynamic> data = {
        'hasCompleted': false,
        'taskContent': "first task",
      };
      DateTime timestamp = DateTime.now();

      bool collectionExists = await collection
          .limit(1)
          .get()
          .then((querySnapshot) => querySnapshot.size > 0);

      if (!collectionExists) {
        await collection.doc(timestamp.toString()).set(data);
      }

      // Add the data to Firestore with the timestamp as the document ID
      await collection.doc(timestamp.toString()).set(data);

      print('Data added successfully with timestamp as document ID!');
    } catch (e) {
      debugPrint(e.toString());
      throw ("some error occured");
    }
  }
}
