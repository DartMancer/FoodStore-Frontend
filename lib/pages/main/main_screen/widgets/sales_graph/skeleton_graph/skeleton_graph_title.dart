import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';

class SkeletonGraphTitle extends StatelessWidget {
  const SkeletonGraphTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Container(
      width: width * 0.2,
      height: width * 0.03,
      decoration: BoxDecoration(
        color: textClr.withOpacity(0.5),
        borderRadius: BorderRadius.circular(width),
      ),
    );
  }
}
