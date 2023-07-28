import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home/widget/task_tile.dart';

class DataReader extends StatelessWidget {
  const DataReader({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('todos').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          final List<FiAs3AmnaTaskTile> taskTiles =
              snapshot.data!.docs.map((doc) {
            final String taskText = doc['taskContent'];

            return FiAs3AmnaTaskTile(
              text: taskText,
            );
          }).toList();

          return ListView.builder(
            itemCount: taskTiles.length,
            itemBuilder: (BuildContext context, int index) {
              return taskTiles[index];
            },
          );
        }
        throw ("error");
      },
    );
  }
}
