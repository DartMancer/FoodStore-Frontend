import 'package:dio/dio.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/data/main/stores_screen/models/store_model.dart';
import 'package:food_store/data/main/stores_screen/stores_screen.dart';
import 'package:get_it/get_it.dart';

class StoresScreenApi {
  Future<List<StoreModel>> getStoresListApi({int? limit}) async {
    String isLimit = limit != null ? '$limit' : '';
    try {
      var response = await GetIt.I<Dio>().request(
        '$urlApi/StoresProduct?limit=$isLimit',
        options: Options(method: 'GET'),
      );

      List storesApi = response.data;

      List<StoreModel> storesScreenData = [];

      for (var i = 0; i < storesApi.length; i++) {
        storesScreenData.add(StoreModel.fromJson(storesApi[i]));
      }

      return storesScreenData;
    } catch (e, st) {
      Logger().handle(e, st);
      return [];
    }
  }

  Future<StoreModel> getStoreApi({required int id}) async {
    try {
      var response = await GetIt.I<Dio>().request(
        '$urlApi/StoresProduct/$id',
        options: Options(method: 'GET'),
      );

      final storesApi = response.data as Map<String, dynamic>;

      final StoreModel storeData = StoreModel.fromJson(storesApi);
      return storeData;
    } catch (e, st) {
      Logger().handle(e, st);
      return StoreModel(
        id: 0,
        storeName: '',
        storeLocation: '',
        productsCount: 0,
        openingTime: '',
        closingTime: '',
        productsList: [],
      );
    }
  }

  Future postStoresScreenApi({required String requestBody}) async {
    try {
      var response = await GetIt.I<Dio>().request(
        '$urlApi/Stores',
        options: Options(method: 'POST'),
        data: requestBody,
      );

      Logger().debug(response.data);
    } catch (e, st) {
      Logger().handle(e, st);
    }
  }

  Future<bool> deleteStoresScreenApi({required int id}) async {
    try {
      var response = await GetIt.I<Dio>().request(
        '$urlApi/Stores/$id',
        options: Options(method: 'DELETE'),
      );

      Logger().debug(response.data);
      return true;
    } catch (e, st) {
      Logger().handle(e, st);
      return false;
    }
  }
}
