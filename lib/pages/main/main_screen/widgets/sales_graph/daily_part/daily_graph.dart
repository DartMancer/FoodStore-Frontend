import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/functions/adaptive_round.dart';
import 'package:food_store/functions/formatter.dart';

class DailyGraph extends StatelessWidget {
  const DailyGraph({
    super.key,
    required this.summerySales,
    required this.todaySpots,
    required this.yesterdaySpots,
    required this.lastWeekSpots,
  });

  final SellingsSummaryModel summerySales;
  final List<FlSpot> todaySpots, yesterdaySpots, lastWeekSpots;

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
                reservedSize: width * 0.03698,
                getTitlesWidget: (value, meta) => Padding(
                  padding: EdgeInsets.only(top: width * 0.011),
                  child: Text(
                    '${value.toInt()}',
                    style: TextStyle(
                      color: textClr,
                      fontSize: width * 0.01,
                      fontFamily: fontApp,
                    ),
                  ),
                ),
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: width * 0.03698,
                getTitlesWidget: (value, meta) {
                  var number = FormattingNumbers(
                    myNumber: GraphMaxRound().adaptiveRound(value.toInt()),
                  ).formatNumber();
                  return Padding(
                    padding: EdgeInsets.only(left: width * 0.0074),
                    child: Text(
                      number,
                      style: TextStyle(
                        color: textClr,
                        fontSize: width * 0.01,
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
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              maxContentWidth: width * 0.7,
              getTooltipColor: (touchedSpot) => textClr,
              fitInsideVertically: true,
              fitInsideHorizontally: true,
              getTooltipItems: (touchedSpots) {
                return [
                  LineTooltipItem(
                    'Время - ${todaySpots[touchedSpots[0].spotIndex].x}:00\n'
                    'Сегодня: ',
                    textAlign: TextAlign.start,
                    TextStyle(
                      color: whiteClr.withOpacity(0.8),
                      fontFamily: fontApp,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${todaySpots[touchedSpots[0].spotIndex].y.toInt()} руб.',
                        style: TextStyle(
                          color: whiteClr,
                          fontFamily: fontApp,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  LineTooltipItem(
                    'Вчера: ',
                    textAlign: TextAlign.start,
                    TextStyle(
                      color: whiteClr.withOpacity(0.8),
                      fontFamily: fontApp,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${yesterdaySpots[touchedSpots[0].spotIndex].y.toInt()} руб.',
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
          minX: 0,
          maxX: 23,
          minY: 0,
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
              spots: yesterdaySpots,
              isCurved: true,
              curveSmoothness: 0.3,
              color: Colors.greenAccent.shade100.withOpacity(0.3),
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
            ),
            LineChartBarData(
              spots: todaySpots,
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
