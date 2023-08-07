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
          int crossAxisCount = (gridItemCount > 1) ? 2 : 1;
          if (gridItemCount == 0) {
            return const SizedBox.shrink();
          }
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
                  return Container(
                    height: 100,
                    width: 100,
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
            ),
          );
        }
      },
    );
  }
}
