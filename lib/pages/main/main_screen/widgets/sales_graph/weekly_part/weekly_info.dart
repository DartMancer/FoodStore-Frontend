import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/pages/main/main_screen/function/function.dart';

class WeekInfoGraphBlock extends StatelessWidget {
  const WeekInfoGraphBlock({
    super.key,
    required this.thisWeekUnits,
    required this.lastWeekUnits,
    required this.thisWeekSales,
    required this.lastWeekSales,
  });

  final double thisWeekUnits;
  final double lastWeekUnits;
  final double thisWeekSales;
  final double lastWeekSales;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        bottom: 20,
      ),
      child: SizedBox(
        height: width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: width * 0.015,
              child: ASText(
                text: 'Сводка за неделю',
                color: whiteClr,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: width * 0.01),
            SizedBox(
              height: width * 0.015,
              child: ASText(
                text: 'Количество',
                color: textClr,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: width * 0.02,
              child: ASText(
                text: '$thisWeekUnits шт.',
                color: whiteClr,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: width * 0.01),
            SizedBox(
              height: width * 0.01,
              child: ASText(
                text: '${thisWeekUnits - lastWeekUnits} шт.',
                color: MainScreenMethods().getTotalColor(
                  thisWeekUnits - lastWeekUnits,
                ),
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: width * 0.01,
              child: ASText(
                text: 'от прошлой недели',
                color: textClr,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: width * 0.01),
            SizedBox(
              height: width * 0.015,
              child: ASText(
                text: 'Сумма',
                color: textClr,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: width * 0.02,
              child: ASText(
                text: '$thisWeekSales руб.',
                color: whiteClr,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: width * 0.01),
            SizedBox(
              height: width * 0.012,
              child: ASText(
                text: '${thisWeekSales - lastWeekSales} руб.',
                color: MainScreenMethods().getTotalColor(
                  thisWeekSales - lastWeekSales,
                ),
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: width * 0.01,
              child: ASText(
                text: 'от прошлой недели',
                color: textClr,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: width * 0.02),
            Row(
              children: [
                Container(
                  width: width * 0.01,
                  height: width * 0.01,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: width * 0.005),
                SizedBox(
                  height: width * 0.012,
                  child: ASText(
                    text: 'Текущая неделя',
                    color: textClr,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            SizedBox(height: width * 0.003),
            Row(
              children: [
                Container(
                  width: width * 0.01,
                  height: width * 0.01,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent.shade100.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: width * 0.005),
                SizedBox(
                  height: width * 0.012,
                  child: ASText(
                    text: 'Прошлая неделя',
                    color: textClr,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
