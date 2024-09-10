// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlySalesModel _$HourlySalesModelFromJson(Map<String, dynamic> json) =>
    HourlySalesModel(
      hour: (json['hour'] as num).toInt(),
      todaySales: (json['todaySales'] as num).toDouble(),
      yesterdaySales: (json['yesterdaySales'] as num).toDouble(),
      lastWeekSales: (json['lastWeekSales'] as num).toDouble(),
    );

Map<String, dynamic> _$HourlySalesModelToJson(HourlySalesModel instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'todaySales': instance.todaySales,
      'yesterdaySales': instance.yesterdaySales,
      'lastWeekSales': instance.lastWeekSales,
    };
