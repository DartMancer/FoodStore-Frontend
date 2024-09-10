part of 'main_screen_bloc.dart';

abstract class MainScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

final class MainScreenInitial extends MainScreenState {}

class MainScreenLoading extends MainScreenState {}

class MainScreenLoaded extends MainScreenState {
  MainScreenLoaded({
    required this.dailyData,
    required this.weeklyData,
    required this.rankingData,
    required this.supplierData,
    required this.stockData,
  });

  final SellingsSummaryModel dailyData, weeklyData;
  final List<RankingProductsModel> rankingData;
  final List<StockModel> stockData;
  final List<SuppliersRankingModel> supplierData;

  @override
  List<Object> get props => [
        dailyData,
        weeklyData,
        rankingData,
        stockData,
        supplierData,
      ];
}

class MainScreenLoadingFailure extends MainScreenState {
  MainScreenLoadingFailure({
    required this.exception,
  });
  final Object? exception;

  @override
  List<Object> get props => [exception!];
}
