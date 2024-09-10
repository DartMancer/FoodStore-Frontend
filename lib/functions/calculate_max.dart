import 'dart:math';

class ClaculateMax {
  double maxDaily({required List<dynamic> dailyData}) {
    var maxToday =
        dailyData.map<double>((e) => e.todaySales.toDouble()).reduce(max);
    var maxYesterday =
        dailyData.map<double>((e) => e.yesterdaySales.toDouble()).reduce(max);
    var maxLastWeek =
        dailyData.map<double>((e) => e.lastWeekSales.toDouble()).reduce(max);
    return [maxToday, maxYesterday, maxLastWeek].reduce(max);
  }

  double maxWeekly({required List<dynamic> dailyData}) {
    var maxThisWeek =
        dailyData.map<double>((e) => e.thisWeek.toDouble()).reduce(max);
    var maxLastWeek =
        dailyData.map<double>((e) => e.lastWeek.toDouble()).reduce(max);
    return [maxThisWeek, maxLastWeek].reduce(max);
  }
}
