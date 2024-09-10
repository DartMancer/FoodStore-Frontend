import 'package:food_store/data/data.dart';

class WeeklySellingsModel extends SellingsSummaryModel {
  WeeklySellingsModel({
    required super.salesSummary,
    required super.salesList,
    required this.lastWeekSummary,
  });

  final SalesSummaryModel lastWeekSummary;
}
