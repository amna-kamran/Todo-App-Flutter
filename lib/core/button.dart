import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final Widget child;
  const Button({
    super.key,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("tapped");
      },
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(12.0),
        width: 250,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            width: 2,
            color: const Color(0xFF9e9898),
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
