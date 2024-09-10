// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklySummaryModel _$WeeklySummaryModelFromJson(Map<String, dynamic> json) =>
    WeeklySummaryModel(
      totalSales: (json['totalSales'] as num).toDouble(),
      totalUnits: (json['totalUnits'] as num).toDouble(),
    );

Map<String, dynamic> _$WeeklySummaryModelToJson(WeeklySummaryModel instance) =>
    <String, dynamic>{
      'totalSales': instance.totalSales,
      'totalUnits': instance.totalUnits,
    };
