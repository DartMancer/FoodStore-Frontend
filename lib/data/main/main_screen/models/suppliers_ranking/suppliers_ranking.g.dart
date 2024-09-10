// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suppliers_ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuppliersRankingModel _$SuppliersRankingModelFromJson(
        Map<String, dynamic> json) =>
    SuppliersRankingModel(
      supplierName: json['supplierName'] as String,
      totalDeliveries: (json['totalDeliveries'] as num).toInt(),
      totalUnitsDelivered: (json['totalUnitsDelivered'] as num).toInt(),
      totalCostOfDeliveries: (json['totalCostOfDeliveries'] as num).toDouble(),
      percentageOfTotalPurchases:
          (json['percentageOfTotalPurchases'] as num).toDouble(),
    );

Map<String, dynamic> _$SuppliersRankingModelToJson(
        SuppliersRankingModel instance) =>
    <String, dynamic>{
      'supplierName': instance.supplierName,
      'totalDeliveries': instance.totalDeliveries,
      'totalUnitsDelivered': instance.totalUnitsDelivered,
      'totalCostOfDeliveries': instance.totalCostOfDeliveries,
      'percentageOfTotalPurchases': instance.percentageOfTotalPurchases,
    };
