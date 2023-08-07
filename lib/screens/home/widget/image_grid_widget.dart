import 'package:flutter/material.dart';

class ImgGrid extends StatelessWidget {
  final Stream<List<String>> imgStream;

  const ImgGrid({Key? key, required this.imgStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<String>>(
      stream: imgStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<String> imgList = snapshot.data!;
          int gridItemCount = imgList.length;

          if (gridItemCount == 0) {
            return const SizedBox.shrink();
          }

          int crossAxisCount = 3;
          int rowCount = (gridItemCount / crossAxisCount).ceil();

          return SizedBox(
            height: rowCount * 80.0,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: gridItemCount,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(imgList[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
