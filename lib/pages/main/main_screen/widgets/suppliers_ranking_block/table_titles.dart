import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';

class TableTitles extends StatelessWidget {
  const TableTitles({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: width * 0.013),
        TableTitle(title: 'Поставщик', wT: width * 0.09323),
        SizedBox(width: width * 0.062),
        TableTitle(title: 'Всего поставок', wT: width * 0.12292),
        SizedBox(width: width * 0.062),
        TableTitle(
          title: 'Количество товара\nпоставлено',
          wT: width * 0.164,
          isTwoLines: true,
        ),
        SizedBox(width: width * 0.062),
        TableTitle(
          title: 'Общая цена\nпоставок',
          wT: width * 0.1,
          isTwoLines: true,
        ),
        SizedBox(width: width * 0.062),
        TableTitle(
          title: 'Процент от общего числа\nпоставок',
          wT: width * 0.20729,
          isTwoLines: true,
        ),
      ],
    );
  }
}

class TableTitle extends StatelessWidget {
  const TableTitle({
    super.key,
    required this.wT,
    required this.title,
    this.isTwoLines = false,
  });

  final double wT;
  final String title;
  final bool isTwoLines;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      width: wT,
      height: isTwoLines ? width * 0.01958 * 2 : width * 0.01958,
      child: ASText(
        text: title,
        color: textClr,
        textAlign: TextAlign.start,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
