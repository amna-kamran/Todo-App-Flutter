import 'package:flutter/material.dart';

class CustomGrid extends StatelessWidget {
  final List<String> img;

  const CustomGrid({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    int gridItemCount = img.length;
    int crossAxisCount = (img.length > 1) ? 2 : 1;

    return SizedBox(
      height: 200,
      width: 200,
      child: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: gridItemCount,
          itemBuilder: (context, index) {
            if (index < img.length) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(img[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
