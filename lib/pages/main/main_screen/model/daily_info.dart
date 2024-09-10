import 'package:fl_chart/fl_chart.dart';

class DailyModel {
  DailyModel({
    required this.todaySpots,
    required this.yesterdaySpots,
    required this.lastWeekSpots,
    required this.todayUnits,
    required this.yesterdayUnits,
    required this.lastWeekUnits,
    required this.todaySales,
    required this.yesterdaySales,
    required this.lastWeekSales,
  });

  final List<FlSpot> todaySpots, yesterdaySpots, lastWeekSpots;
  final double todayUnits,
      yesterdayUnits,
      lastWeekUnits,
      todaySales,
      yesterdaySales,
      lastWeekSales;
}
