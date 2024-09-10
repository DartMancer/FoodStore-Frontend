import 'package:fl_chart/fl_chart.dart';

class WeeklyModel {
  WeeklyModel({
    required this.thisWeekSpots,
    required this.lastWeekSpots,
    required this.thisWeekUnits,
    required this.lastWeekUnits,
    required this.thisWeekSales,
    required this.lastWeekSales,
  });

  final List<FlSpot> thisWeekSpots, lastWeekSpots;
  final double thisWeekUnits, lastWeekUnits, thisWeekSales, lastWeekSales;
}
