import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/core/utils/utils.dart';
import 'package:food_store/data/data.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc(
    this.sellingsApi,
    this.rankingApi,
    this.stockApi,
    this.suppliersApi,
  ) : super(MainScreenInitial()) {
    on<LoadMainScreenData>((event, emit) async {
      try {
        emit(MainScreenLoading());
        final dailyData = await sellingsApi.fetchSellingsApi('daily');
        final weeklyData = await sellingsApi.fetchSellingsApi('weekly');
        final productRankData = await rankingApi.getProductsRankApi(limit: 4);
        final stockData = await stockApi.getStockApi(limit: 4);
        final supplierData = await suppliersApi.getSuppliersRankApi(limit: 5);
        emit(
          MainScreenLoaded(
            dailyData: dailyData,
            weeklyData: weeklyData,
            rankingData: productRankData,
            stockData: stockData,
            supplierData: supplierData,
          ),
        );
      } catch (e, st) {
        emit(MainScreenLoadingFailure(exception: e));
        Logger().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }
  final SellingsGraphApi sellingsApi;
  final RankingProductsApi rankingApi;
  final StocksApi stockApi;
  final SuppliersRankApi suppliersApi;
}
