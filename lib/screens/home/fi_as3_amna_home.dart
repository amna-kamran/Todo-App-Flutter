import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widget/fi_as3_amna_task_tile.dart';

import '../../Themes/fi_as3_amna_colors.dart';

class FiAs3AmnaHome extends StatefulWidget {
  const FiAs3AmnaHome({super.key});

  @override
  State<FiAs3AmnaHome> createState() => _FiAs3AmnaHomeState();
}

class _FiAs3AmnaHomeState extends State<FiAs3AmnaHome> {
  List<Widget> dynamicWidgets = [
    FiAs3AmnaTaskTile(
      text: "1243",
    ),
    FiAs3AmnaTaskTile(
      text: "22222",
    ),
    FiAs3AmnaTaskTile(
      text: "amna",
    ),
  ];

  void addNewTile() {
    setState(() {
      dynamicWidgets.add(
        const FiAs3AmnaTaskTile(
          text: "ddd",
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTile();
          debugPrint("pressed");
        },
        backgroundColor: CustomColors.yellow,
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: CustomColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: dynamicWidgets,
          ),
        ),
      ),
    );
  }
}
