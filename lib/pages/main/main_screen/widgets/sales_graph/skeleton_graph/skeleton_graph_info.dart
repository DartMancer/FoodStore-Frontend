import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';

class SkeletonGraphInfo extends StatelessWidget {
  const SkeletonGraphInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        bottom: 20,
      ),
      child: Container(
        width: width * 0.115,
        height: width * 0.3,
        decoration: BoxDecoration(
          color: textClr.withOpacity(0.5),
          borderRadius: BorderRadius.circular(width * 0.01),
        ),
      ),
    );
  }
}
