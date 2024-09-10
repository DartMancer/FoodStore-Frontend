// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingProductsModel _$RankingProductsModelFromJson(
        Map<String, dynamic> json) =>
    RankingProductsModel(
      storeName: json['storeName'] as String,
      productName: json['productName'] as String,
      totalUnitsSold: (json['totalUnitsSold'] as num).toInt(),
      totalSales: (json['totalSales'] as num).toDouble(),
      totalProfit: (json['totalProfit'] as num).toDouble(),
    );

Map<String, dynamic> _$RankingProductsModelToJson(
        RankingProductsModel instance) =>
    <String, dynamic>{
      'storeName': instance.storeName,
      'productName': instance.productName,
      'totalUnitsSold': instance.totalUnitsSold,
      'totalSales': instance.totalSales,
      'totalProfit': instance.totalProfit,
    };
