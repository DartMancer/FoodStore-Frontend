import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';

class SkeletonGraphStroke extends StatelessWidget {
  const SkeletonGraphStroke({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Column(
      children: [
        SizedBox(height: width * 0.01),
        Container(
          width: width * 0.52,
          height: width * 0.04,
          decoration: BoxDecoration(
            color: textClr.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
    );
  }
}
