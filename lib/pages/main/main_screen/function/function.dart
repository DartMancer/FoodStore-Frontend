import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/pages/main/main_screen/model/daily_info.dart';
import 'package:food_store/pages/main/main_screen/model/weekly_model.dart';

class MainScreenMethods {
  Color getTotalColor(double equation) {
    return equation == 0
        ? whiteClr
        : equation.isNegative
            ? errorColor
            : Colors.greenAccent;
  }

  DailyModel dailyBloc({required SellingsSummaryModel summeryData}) {
    return DailyModel(
      todaySpots: summeryData.salesList.map((hourlyData) {
        return FlSpot(
          hourlyData.hour.toDouble(),
          hourlyData.todaySales,
        );
      }).toList(),
      yesterdaySpots: summeryData.salesList.map((hourlyData) {
        return FlSpot(
          hourlyData.hour.toDouble(),
          hourlyData.yesterdaySales,
        );
      }).toList(),
      lastWeekSpots: summeryData.salesList.map((hourlyData) {
        return FlSpot(
          hourlyData.hour.toDouble(),
          hourlyData.lastWeekSales,
        );
      }).toList(),
      todayUnits: summeryData.salesSummary.totalUnits,
      yesterdayUnits: summeryData.yesterdaySummary!.totalUnits,
      lastWeekUnits: summeryData.lastWeekSummary!.totalUnits,
      todaySales: summeryData.salesSummary.totalSales,
      yesterdaySales: summeryData.yesterdaySummary!.totalSales,
      lastWeekSales: summeryData.lastWeekSummary!.totalSales,
    );
  }

  WeeklyModel weeklyBloc({required SellingsSummaryModel summeryData}) {
    return WeeklyModel(
      thisWeekSpots: List.generate(7, (index) {
        var data = summeryData.salesList;
        return FlSpot(
          index.toDouble(),
          data[index].thisWeek,
        );
      }),
      lastWeekSpots: List.generate(7, (index) {
        var data = summeryData.salesList;
        return FlSpot(
          index.toDouble(),
          data[index].lastWeek,
        );
      }),
      thisWeekUnits: summeryData.salesSummary.totalUnits,
      lastWeekUnits: summeryData.lastWeekSummary!.totalUnits,
      thisWeekSales: summeryData.salesSummary.totalSales,
      lastWeekSales: summeryData.lastWeekSummary!.totalSales,
    );
  }
}
