import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';

class MainScreenBlocksTitle extends StatelessWidget {
  const MainScreenBlocksTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: width * 0.01),
        SizedBox(
          height: width * 0.05,
          child: ASText(
            text: title,
            color: textClr,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
