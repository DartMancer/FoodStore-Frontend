import 'package:dio/dio.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/data/main/main_screen/models/models.dart';
import 'package:get_it/get_it.dart';

class SellingsGraphApi {
  Future<SellingsSummaryModel> fetchSellingsApi(String type) async {
    bool isDaily = type == 'daily';
    try {
      var endpoint = isDaily ? 'daily-sales-summary' : 'weekly-sales-summary';
      var response = await GetIt.I<Dio>().request(
        '$urlApi/Sales/$endpoint',
        options: Options(method: 'GET'),
      );

      final sellingsApi = response.data as Map<String, dynamic>;

      List sales = [];
      int limit = isDaily ? 24 : 7;

      for (var i = 0; i < limit; i++) {
        sales.add(
          isDaily
              ? HourlySalesModel.fromJson(sellingsApi['hourlySales'][i])
              : DailySalesModel.fromJson(sellingsApi['dailySales'][i]),
        );
      }

      final SellingsSummaryModel sellingData = isDaily
          ? DailySellingsModel(
              salesSummary: DailySummaryModel.fromJson(
                sellingsApi['dailySummary'],
              ),
              yesterdaySummary: DailySummaryModel.fromJson(
                sellingsApi['yesterdaySummary'],
              ),
              lastWeekSummary: DailySummaryModel.fromJson(
                sellingsApi['lastWeekSummary'],
              ),
              salesList: sales,
            )
          : WeeklySellingsModel(
              salesSummary: WeeklySummaryModel.fromJson(
                sellingsApi['weeklySummary'],
              ),
              lastWeekSummary: WeeklySummaryModel.fromJson(
                sellingsApi['lastWeekSummary'],
              ),
              salesList: sales,
            );

      return sellingData;
    } on Exception catch (e, st) {
      Logger().handle(e, st);
      return DailySellingsModel(
        salesSummary: DailySummaryModel(totalSales: 0, totalUnits: 0),
        yesterdaySummary: DailySummaryModel(totalSales: 0, totalUnits: 0),
        lastWeekSummary: DailySummaryModel(totalSales: 0, totalUnits: 0),
        salesList: [],
      );
    }
  }
}
