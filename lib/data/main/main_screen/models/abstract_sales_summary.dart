abstract class SalesSummaryModel {
  SalesSummaryModel({
    required this.totalSales,
    required this.totalUnits,
  });

  final double totalSales;
  final double totalUnits;
}

abstract class SellingsSummaryModel {
  SellingsSummaryModel({
    required this.salesSummary,
    required this.salesList,
    this.yesterdaySummary,
    this.lastWeekSummary,
  });

  final SalesSummaryModel salesSummary;
  final List salesList;
  final SalesSummaryModel? yesterdaySummary, lastWeekSummary;
}
