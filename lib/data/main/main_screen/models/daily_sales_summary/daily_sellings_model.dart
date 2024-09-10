import 'package:food_store/data/data.dart';

class DailySellingsModel extends SellingsSummaryModel {
  DailySellingsModel({
    required super.salesSummary,
    required super.salesList,
    required this.yesterdaySummary,
    required this.lastWeekSummary,
  });

  final SalesSummaryModel yesterdaySummary, lastWeekSummary;
}
