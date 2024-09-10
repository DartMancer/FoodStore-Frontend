import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';

class DetailedButton extends StatelessWidget {
  const DetailedButton({super.key, required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width * 0.12,
          height: width * 0.02,
          child: ASText(
            text: 'Подробнее',
            color: textClr,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(
          width: width * 0.12,
          height: width * 0.025,
          child: MaterialButton(
            onPressed: () => onPressed(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
