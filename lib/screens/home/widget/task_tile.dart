import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/screens/home/widget/show_overlay.dart';

import '../../../constants/spaces.dart';
import '../../../services/data_deletion.dart';
import '../../../services/data_update.dart';
import '../../../themes/colors.dart';
import '../../../utils/assets.dart';
import 'overlay_manager.dart';

class TaskTile extends StatelessWidget {
  final String text;
  final String id;
  final bool hasCompleted;

  const TaskTile({
    Key? key,
    required this.text,
    this.id = "",
    required this.hasCompleted,
  }) : super(key: key);

  void _handleCheckBoxTap(BuildContext context) {
    updateCompletedField(id, !hasCompleted);
  }

  void _handleDeleteTap() {
    deleteData(id);
  }

  void _handleTileTap(BuildContext context) {
    OverlayManager.storeContext(context);
    ShowOverlay.show(
      context,
      initialTaskText: text,
      isEditing: true,
      id: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: () => _handleTileTap(context),
      duration: const Duration(milliseconds: 100),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        decoration: BoxDecoration(
          color: CustomColors.tileColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                _handleCheckBoxTap(context);
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
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  text,
                  style: TextStyle(
                    decoration: hasCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: CustomColors.yellow,
                    decorationThickness: 2.0,
                    color: hasCompleted
                        ? CustomColors.lightGrey
                        : CustomColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: _handleDeleteTap,
              child: SvgPicture.asset(
                Assets.crossSvg,
                height: 30,
                width: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
