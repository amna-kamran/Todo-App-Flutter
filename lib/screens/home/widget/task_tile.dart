import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';

import 'package:todo_app/services/todo_provider.dart';
import 'package:todo_app/utils/show_overlay.dart';

import '../../../constants/assets.dart';
import '../../../constants/spaces.dart';
import '../../../themes/colors.dart';
import '../../../utils/overlay_manager.dart';

class TaskTile extends StatelessWidget {
  final String text;
  final String id;
  final bool hasCompleted;

  TaskTile({
    Key? key,
    required this.text,
    this.id = "",
    required this.hasCompleted,
  }) : super(key: key);

  final TodoProvider todoMethods = TodoProvider();

  void _handleCheckBoxTap() {
    todoMethods.updateTask(id, {'hasCompleted': !hasCompleted});
  }

  void _handleDeleteTap() {
    todoMethods.deleteData(id);
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
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: CustomColors.accent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                _handleCheckBoxTap();
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
                        : CustomColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: _handleDeleteTap,
                icon: const Icon(
                  Icons.cancel,
                  color: CustomColors.darkGrey,
                  size: 22,
                ))
          ],
        ),
      ),
    );
  }
}
