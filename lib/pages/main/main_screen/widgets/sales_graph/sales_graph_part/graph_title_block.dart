import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';

import 'graph_button.dart';

class GraphTitleBlock extends StatelessWidget {
  const GraphTitleBlock({
    super.key,
    required this.isActive,
    required this.todayBtn,
    required this.weekBtn,
  });

  final bool isActive;
  final Function todayBtn;
  final Function weekBtn;

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
            text: 'Продажи',
            color: textClr,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: width * 0.02),
        GraphButton(
          title: 'Сегодня',
          isActive: isActive,
          btnEvent: todayBtn,
        ),
        SizedBox(width: width * 0.01),
        GraphButton(
          title: 'Неделя',
          isActive: !isActive,
          btnEvent: weekBtn,
        ),
      ],
    );
  }
}
