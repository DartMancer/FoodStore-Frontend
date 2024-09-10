// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySummaryModel _$DailySummaryModelFromJson(Map<String, dynamic> json) =>
    DailySummaryModel(
      totalSales: (json['totalSales'] as num).toDouble(),
      totalUnits: (json['totalUnits'] as num).toDouble(),
    );

Map<String, dynamic> _$DailySummaryModelToJson(DailySummaryModel instance) =>
    <String, dynamic>{
      'totalSales': instance.totalSales,
      'totalUnits': instance.totalUnits,
    };
