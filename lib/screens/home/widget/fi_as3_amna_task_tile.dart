import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Themes/fi_as3_amna_colors.dart';
import '../../../constants/fi_as3_amna_spaces.dart';
import '../../../utils/fi_as3_amna_assets.dart';

class FiAs3AmnaTaskTile extends StatefulWidget {
  final String text;

  const FiAs3AmnaTaskTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<FiAs3AmnaTaskTile> createState() => _FiAs3AmnaTaskTileState();
}

class _FiAs3AmnaTaskTileState extends State<FiAs3AmnaTaskTile> {
  bool hasCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      padding: const EdgeInsets.only(left: 25, top: 30, bottom: 30, right: 25),
      decoration: BoxDecoration(
        color: CustomColors.tileColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                hasCompleted = !hasCompleted;
              });
            },
            child: hasCompleted
                ? SvgPicture.asset(
                    Assets.checkBoxYellowSvg,
                    height: 20,
                    width: 20,
                  )
                : SvgPicture.asset(
                    Assets.boxSvg,
                    height: 20,
                    width: 20,
                  ),
          ),
          Spaces.w25,
          Flexible(
            // Wrap the text with Flexible
            child: Text(
              widget.text,
              style: TextStyle(
                decoration: hasCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor:
                    CustomColors.yellow, // Optional: Set the color of the line
                decorationThickness: 2.0,
                color: hasCompleted
                    ? CustomColors.lightGrey
                    : CustomColors.textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
