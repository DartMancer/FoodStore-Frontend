import 'package:dio/dio.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/data/main/main_screen/models/models.dart';
import 'package:get_it/get_it.dart';

class RankingProductsApi {
  Future<List<RankingProductsModel>> getProductsRankApi({int? limit}) async {
    String isLimit = limit != null ? '$limit' : '';
    try {
      var response = await GetIt.I<Dio>().request(
        '$urlApi/RatingProduct/product-sales-ranking?limit=$isLimit',
        options: Options(method: 'GET'),
      );

      List sellingsApi = response.data;

      List<RankingProductsModel> rankProduct = [];

      for (var i = 0; i < sellingsApi.length; i++) {
        rankProduct.add(RankingProductsModel.fromJson(sellingsApi[i]));
      }

      return rankProduct;
    } on Exception catch (e, st) {
      Logger().handle(e, st);
      return [];
    }
  }
}
