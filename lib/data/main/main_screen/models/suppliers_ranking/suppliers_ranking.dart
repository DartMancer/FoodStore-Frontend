import 'package:json_annotation/json_annotation.dart';

part 'suppliers_ranking.g.dart';

@JsonSerializable()
class SuppliersRankingModel {
  SuppliersRankingModel({
    required this.supplierName,
    required this.totalDeliveries,
    required this.totalUnitsDelivered,
    required this.totalCostOfDeliveries,
    required this.percentageOfTotalPurchases,
  });

  final String supplierName;
  final int totalDeliveries, totalUnitsDelivered;
  final double totalCostOfDeliveries, percentageOfTotalPurchases;

  factory SuppliersRankingModel.fromJson(Map<String, dynamic> json) =>
      _$SuppliersRankingModelFromJson(json);

  Map<String, dynamic> toJson() => _$SuppliersRankingModelToJson(this);
}
