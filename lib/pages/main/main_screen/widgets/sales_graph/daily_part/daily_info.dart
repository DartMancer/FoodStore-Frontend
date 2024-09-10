import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/pages/main/main_screen/function/function.dart';

class DayInfoGraphBlock extends StatelessWidget {
  const DayInfoGraphBlock({
    super.key,
    required this.todayUnits,
    required this.yesterdayUnits,
    required this.lastWeekUnits,
    required this.todaySales,
    required this.yesterdaySales,
    required this.lastWeekSales,
  });

  final double todayUnits;
  final double yesterdayUnits;
  final double lastWeekUnits;
  final double todaySales;
  final double yesterdaySales;
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
                text: 'Сводка за сегодня',
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
                text: '$todayUnits шт.',
                color: whiteClr,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: width * 0.01),
            SizedBox(
              height: width * 0.01,
              child: ASText(
                text: '${todayUnits - yesterdayUnits} шт.',
                color: MainScreenMethods().getTotalColor(
                  todayUnits - yesterdayUnits,
                ),
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: width * 0.01,
              child: ASText(
                text: 'от вчера',
                color: textClr,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: width * 0.01),
            SizedBox(
              height: width * 0.01,
              child: ASText(
                text: '${todayUnits - lastWeekUnits} шт.',
                color: MainScreenMethods().getTotalColor(
                  todayUnits - lastWeekUnits,
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
                text: '$todaySales руб.',
                color: whiteClr,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: width * 0.01),
            SizedBox(
              height: width * 0.012,
              child: ASText(
                text: '${todaySales - yesterdaySales} руб.',
                color: MainScreenMethods().getTotalColor(
                  todaySales - yesterdaySales,
                ),
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: width * 0.01,
              child: ASText(
                text: 'от вчера',
                color: textClr,
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: width * 0.01),
            SizedBox(
              height: width * 0.012,
              child: ASText(
                text: '${todaySales - lastWeekSales} руб.',
                color: MainScreenMethods().getTotalColor(
                  todaySales - lastWeekSales,
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
                    text: 'Сегодня',
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
                    color: Colors.greenAccent.shade100.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: width * 0.005),
                SizedBox(
                  height: width * 0.012,
                  child: ASText(
                    text: 'Вчера',
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
                    text: 'Неднелю назад',
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
