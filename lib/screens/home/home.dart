import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widget/overlay_manager.dart';

import 'package:todo_app/screens/home/widget/scroll_search_bar.dart';
import 'package:todo_app/screens/home/widget/show_overlay.dart';
import 'package:todo_app/services/data_reader.dart';

import '../../Themes/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 15),
        child: FloatingActionButton(
          onPressed: () {
            FormFieldOverlay.show(context);
            OverlayManager.storeContext(context);
            debugPrint("pressed");
          },
          backgroundColor: CustomColors.yellow,
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
      backgroundColor: CustomColors.backgroundColor,
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            SearchBarWidget(),
            SizedBox(
              height: 750,
              child: DataReader(),
            ),
          ]),
        ),
      ),
    );
  }
}
