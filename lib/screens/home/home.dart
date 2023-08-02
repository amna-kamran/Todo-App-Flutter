import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widget/task_list.dart';
import 'package:todo_app/services/auth_provider.dart';
import 'package:todo_app/utils/show_dialog.dart';
import '../../themes/colors.dart';
import 'widget/search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 15),
        child: FloatingActionButton(
          onPressed: () {
            ShowDialog.show(context);
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
            Padding(
              padding: const EdgeInsets.only(top: 12, right: 15),
              child: IconButton(
                onPressed: () async {
                  await AuthProvider.logout();
                },
                icon: const Icon(
                  Icons.logout_sharp,
                  size: 25,
                  color: CustomColors.mediumGrey,
                ),
              ),
            ),
            SearchBarWidget(focusNode: FocusNode()),
            const SizedBox(
              height: 750,
              child: TaskListWidget(),
            ),
          ]),
        ),
      ),
    );
  }
}
