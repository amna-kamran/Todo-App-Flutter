import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/screens/home/widget/image_grid_widget.dart';
import 'package:todo_app/services/media/data_provider.dart';
import 'package:todo_app/services/todo_provider.dart';
import 'package:todo_app/utils/dialog/show_dialog.dart';
import '../../../constants/assets.dart';
import '../../../constants/spaces.dart';
import '../../../themes/colors.dart';

final TodoProvider todoProvider = TodoProvider();

class TaskTileWidget extends StatelessWidget {
  final String text;
  final String id;
  final bool hasCompleted;

  const TaskTileWidget({
    Key? key,
    required this.text,
    this.id = "",
    required this.hasCompleted,
  }) : super(key: key);

  void _handleCheckBoxTap() {
    todoProvider.updateTask(id, {'hasCompleted': !hasCompleted});
  }

  void _handleDeleteTap() {
    todoProvider.deleteData(id);
  }

  @override
  Widget build(BuildContext context) {
    Stream<List<String>> imgStream = MediaProvider.fetchImgURLs(id);

    return Bounce(
      onPressed: () {
        ShowDialog.show(
          context,
          initialTaskText: text,
          id: id,
          isEditing: true,
        );
      },
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
              child: Column(
                children: [
                  Container(
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
                  Spaces.h20,
                  ImgGrid(
                    imgStream: imgStream,
                  ),
                ],
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
