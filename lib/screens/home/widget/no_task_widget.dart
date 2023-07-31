import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/assets.dart';
import '../../../constants/spaces.dart';
import '../../../themes/colors.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.notesSvg,
          color: CustomColors.accent,
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
}
