import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/themes/colors.dart';
import 'package:todo_app/constants/spaces.dart';
import 'package:todo_app/constants/assets.dart';

class SearchBarWidget extends StatefulWidget {
  final FocusNode focusNode;

  const SearchBarWidget({required this.focusNode, Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarWidget> {
  final FocusNode _searchFocusNode = FocusNode();
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
          color: CustomColors.accent,
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
            Expanded(
              child: TextField(
                onChanged: (value) {},
                focusNode: _searchFocusNode,
                style: const TextStyle(
                  color: CustomColors.mediumGrey,
                  fontSize: 16,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: CustomColors.mediumGrey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
