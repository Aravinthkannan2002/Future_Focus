import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: 4, // Number of skeleton items to show
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 15,
                    width: 100,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 15,
                    width: 150,
                    color: Colors.grey[300],
                  ),
                  const Spacer(),
                  Container(
                    height: 15,
                    width: 80,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
