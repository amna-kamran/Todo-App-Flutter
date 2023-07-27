import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todo_app/Themes/fi_as3_amna_colors.dart';
import 'package:todo_app/constants/fi_as3_amna_spaces.dart';
import 'login.dart';

class FiA3RohanSplasher extends StatefulWidget {
  const FiA3RohanSplasher({super.key});

  @override
  State<FiA3RohanSplasher> createState() => _FiA3RohanSplasherState();
}

class _FiA3RohanSplasherState extends State<FiA3RohanSplasher> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spaces.h25,
            Text.rich(TextSpan(
                text: ' Keep On\n',
                style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 4,
                    fontFamily: 'Rubik Medium',
                    color: Colors.white),
                children: <InlineSpan>[
                  TextSpan(
                      text: '   Time',
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Rubik Medium',
                          color: Colors.white)),
                ])),
          ],
        ),
      ),
    );
  }
}
