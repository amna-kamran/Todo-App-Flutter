import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widget/display_task_list.dart';
import 'package:todo_app/services/todo_provider.dart';
import 'package:todo_app/utils/overlay_manager.dart';
import 'package:todo_app/utils/show_overlay.dart';

import '../../themes/colors.dart';
import 'widget/search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 15),
          child: FloatingActionButton(
            onPressed: () {
              ShowOverlay.show(
                context,
                initialTaskText: '',
              );
              OverlayManager.storeContext(context);
            },
            backgroundColor: CustomColors.yellow,
            child: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
        backgroundColor: CustomColors.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(children: [
              SearchBarWidget(focusNode: FocusNode()),
              SizedBox(
                height: 750,
                child: displayTaskList(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
