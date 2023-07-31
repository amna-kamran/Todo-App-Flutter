import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/constants/spaces.dart';
import 'package:todo_app/themes/colors.dart';

import '../constants/assets.dart';
import '../screens/home/widget/task_tile.dart';

class DataReader extends StatelessWidget {
  const DataReader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('todos').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        try {
          if (snapshot.hasData) {
            final List<TaskTile> taskTiles = snapshot.data!.docs
                .map(
                  (doc) {
                    final String taskText = doc['taskContent'];
                    final bool hasCompleted = doc['hasCompleted'];

                    return TaskTile(
                      hasCompleted: hasCompleted,
                      text: taskText,
                      id: doc.id,
                    );
                  },
                )
                .toList()
                .reversed
                .toList();

            if (taskTiles.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.notesSvg,
                    color: CustomColors.tileColor,
                  ),
                  Spaces.h20,
                  const Text(
                    'No tasks here yet',
                    style: TextStyle(
                      color: Color.fromARGB(255, 58, 58, 58),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              );
            }

            return ListView.builder(
              itemCount: taskTiles.length,
              itemBuilder: (BuildContext context, int index) {
                return taskTiles[index];
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        } catch (e) {
          return Center(
            child: Text('Error loading data: $e'),
          );
        }
      },
    );
  }
}
