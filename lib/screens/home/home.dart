import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widget/overlay_widget.dart';
import 'package:todo_app/screens/home/widget/scroll_search_bar.dart';
import 'package:todo_app/services/data_reader.dart';

import '../../Themes/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  OverlayEntry? overlayEntry;

  void showOverlay() {
    void removeOverlay() {
      overlayEntry?.remove();
      overlayEntry = null;
    }

    overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          if (!FocusScope.of(context).hasPrimaryFocus) {
            removeOverlay();
          }
        },
        child: OverlayEntryWidget(
          onFormSubmit: (text) {
            // Do something with the form field text here
            debugPrint("Form field text: $text");
            removeOverlay();
          },
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 15),
        child: FloatingActionButton(
          onPressed: () {
            showOverlay();
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
