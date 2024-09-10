import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_store/core/core.dart';

class SkeletonRankData extends StatelessWidget {
  const SkeletonRankData({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.25,
      height: width * 0.25,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 16,
                    decoration: BoxDecoration(
                      color: textClr,
                      borderRadius: BorderRadius.circular(width * 0.01042),
                    ),
                  ),
                  SizedBox(height: width * 0.005),
                  Container(
                    width: width * 0.22812,
                    height: width * 0.03542,
                    decoration: BoxDecoration(
                      color: textClr,
                      borderRadius: BorderRadius.circular(width * 0.01042),
                    ),
                  ),
                  SizedBox(height: width * 0.01),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
