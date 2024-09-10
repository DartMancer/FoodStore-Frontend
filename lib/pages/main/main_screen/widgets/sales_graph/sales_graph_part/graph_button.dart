import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';

class GraphButton extends StatelessWidget {
  const GraphButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.btnEvent,
  });

  final String title;
  final bool isActive;
  final Function btnEvent;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;

    return Stack(
      children: [
        Container(
          width: width * 0.1,
          height: width * 0.03,
          decoration: BoxDecoration(
            color: isActive ? textClr : elementsClr,
            border: Border.all(color: textClr),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        SizedBox(
          width: width * 0.1,
          height: width * 0.03,
          child: MaterialButton(
            onPressed: () => btnEvent(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
              height: width * 0.02,
              child: ASText(
                text: title,
                color: whiteClr,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
