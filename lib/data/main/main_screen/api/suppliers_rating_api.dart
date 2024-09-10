import 'package:dio/dio.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/data.dart';
import 'package:food_store/data/main/main.dart';
import 'package:food_store/data/main/main_screen/models/models.dart';
import 'package:get_it/get_it.dart';

class SuppliersRankApi {
  Future<List<SuppliersRankingModel>> getSuppliersRankApi({int? limit}) async {
    String isLimit = limit != null ? '$limit' : '';
    try {
      var response = await GetIt.I<Dio>().request(
        '$urlApi/Suppliers/get-supplier-deliveries?limit=$isLimit',
        options: Options(method: 'GET'),
      );

      List suppliersApi = response.data;

      List<SuppliersRankingModel> rankSuppliers = [];

      for (var i = 0; i < suppliersApi.length; i++) {
        rankSuppliers.add(SuppliersRankingModel.fromJson(suppliersApi[i]));
      }

      return rankSuppliers;
    } on Exception catch (e, st) {
      Logger().handle(e, st);
      return [];
    }
  }
}
