import 'package:json_annotation/json_annotation.dart';

part 'ranking_products.g.dart';

@JsonSerializable()
class RankingProductsModel {
  RankingProductsModel({
    required this.storeName,
    required this.productName,
    required this.totalUnitsSold,
    required this.totalSales,
    required this.totalProfit,
  });

  final String storeName, productName;
  final int totalUnitsSold;
  final double totalSales, totalProfit;

  factory RankingProductsModel.fromJson(Map<String, dynamic> json) =>
      _$RankingProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RankingProductsModelToJson(this);
}
