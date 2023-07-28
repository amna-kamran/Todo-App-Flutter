import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/Themes/colors.dart';
import 'package:todo_app/constants/spaces.dart';
import 'package:todo_app/utils/assets.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
          top: 20,
        ),
        padding: const EdgeInsets.only(left: 25),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.tileColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.searchSvg,
              height: 20,
              width: 20,
            ),
            Spaces.w15,
            const Text(
              "Search",
              style: TextStyle(color: CustomColors.mediumGrey),
            ),
          ],
        ));
  }
}
