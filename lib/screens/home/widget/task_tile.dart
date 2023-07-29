// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Themes/colors.dart';
import '../../../constants/spaces.dart';
import '../../../services/data_deletion.dart';
import '../../../services/data_update.dart';
import '../../../utils/assets.dart';

class FiAs3AmnaTaskTile extends StatefulWidget {
  final String text;
  String id;
  bool hasCompleted;
  FiAs3AmnaTaskTile({
    Key? key,
    required this.text,
    this.id = "",
    required this.hasCompleted,
  }) : super(key: key);

  @override
  State<FiAs3AmnaTaskTile> createState() => _FiAs3AmnaTaskTileState();
}

class _FiAs3AmnaTaskTileState extends State<FiAs3AmnaTaskTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FirebaseFirestore.instance
            .collection('todos')
            .doc(widget.id)
            .get()
            .then(
          (DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              debugPrint(documentSnapshot['taskContent']);
            }
          },
        );

        //document snapshot and id is printed and overlay opens
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 10,
        ),
        padding:
            const EdgeInsets.only(left: 25, top: 30, bottom: 30, right: 25),
        decoration: BoxDecoration(
          color: CustomColors.tileColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(
                  () {
                    widget.hasCompleted = !widget.hasCompleted;
                  },
                );
                updateCompletedField(widget.id, widget.hasCompleted);
              },
              child: widget.hasCompleted
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
                  widget.text,
                  style: TextStyle(
                    decoration: widget.hasCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: CustomColors.yellow,
                    decorationThickness: 2.0,
                    color: widget.hasCompleted
                        ? CustomColors.lightGrey
                        : CustomColors.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                deleteData(widget.id);
              },
              child: SvgPicture.asset(
                Assets.crossSvg,
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
