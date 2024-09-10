import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/functions/adaptive_round.dart';
import 'package:food_store/functions/formatter.dart';

class WeeklyGraph extends StatelessWidget {
  const WeeklyGraph({
    super.key,
    required this.daysList,
    required this.lastWeekSpots,
    required this.thisWeekSpots,
  });

  final List<dynamic> daysList;
  final List<FlSpot> lastWeekSpots, thisWeekSpots;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;

    return SizedBox(
      width: width * 0.55,
      height: width * 0.3,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: textClr.withOpacity(0.2),
                strokeWidth: 2,
                dashArray: [5, 5],
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            leftTitles: const AxisTitles(
              axisNameWidget: null,
            ),
            topTitles: const AxisTitles(axisNameWidget: null),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    daysList[value.toInt()].day,
                    style: TextStyle(
                      color: textClr,
                      fontSize: 14,
                      fontFamily: fontApp,
                    ),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 70,
                getTitlesWidget: (value, meta) {
                  var number = FormattingNumbers(
                    myNumber: GraphMaxRound().adaptiveRound(value.toInt()),
                  ).formatNumber();
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      number,
                      style: TextStyle(
                        color: textClr,
                        fontSize: 14,
                        fontFamily: fontApp,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              top: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide(
                width: 1,
                color: textClr.withOpacity(0.5),
              ),
              bottom: BorderSide(
                width: 1,
                color: textClr.withOpacity(0.5),
              ),
            ),
          ),
          minY: 0,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              maxContentWidth: width * 0.7,
              getTooltipColor: (touchedSpot) => textClr,
              fitInsideVertically: true,
              fitInsideHorizontally: true,
              getTooltipItems: (touchedSpots) {
                String today = FormattingDates(
                  date: DateTime.now(),
                ).formatDate();
                String dates = FormattingDates(
                  date: daysList[touchedSpots[0].spotIndex].date,
                ).formatDate();

                return [
                  LineTooltipItem(
                    'Дата - ${touchedSpots[0].spotIndex != 6 ? dates : today}\n'
                    'Текущая неделя: ',
                    textAlign: TextAlign.start,
                    TextStyle(
                      color: whiteClr.withOpacity(0.8),
                      fontFamily: fontApp,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${thisWeekSpots[touchedSpots[0].spotIndex].y.toInt()} руб.',
                        style: TextStyle(
                          color: whiteClr,
                          fontFamily: fontApp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  LineTooltipItem(
                    'Прошлая неделя: ',
                    textAlign: TextAlign.start,
                    TextStyle(
                      color: whiteClr.withOpacity(0.8),
                      fontFamily: fontApp,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${lastWeekSpots[touchedSpots[0].spotIndex].y.toInt().toString()} руб.',
                        style: TextStyle(
                          color: whiteClr,
                          fontFamily: fontApp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ];
              },
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: lastWeekSpots,
              isCurved: true,
              curveSmoothness: 0.3,
              preventCurveOverShooting: false,
              preventCurveOvershootingThreshold: 0,
              color: Colors.amberAccent.shade100.withOpacity(0.1),
              barWidth: 2,
              dotData: FlDotData(show: false),
              dashArray: [5, 5],
              belowBarData: BarAreaData(
                show: true,
                color: Colors.amberAccent.shade100.withOpacity(0.05),
              ),
            ),
            LineChartBarData(
              spots: thisWeekSpots,
              isCurved: true,
              curveSmoothness: 0.3,
              color: Colors.blueAccent,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blueAccent.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
