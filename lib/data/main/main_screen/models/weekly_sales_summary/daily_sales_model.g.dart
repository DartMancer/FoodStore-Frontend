// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailySalesModel _$DailySalesModelFromJson(Map<String, dynamic> json) =>
    DailySalesModel(
      day: json['day'] as String,
      date: DateTime.parse(json['date'] as String),
      thisWeek: (json['thisWeek'] as num).toDouble(),
      lastWeek: (json['lastWeek'] as num).toDouble(),
    );

Map<String, dynamic> _$DailySalesModelToJson(DailySalesModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'date': instance.date.toIso8601String(),
      'thisWeek': instance.thisWeek,
      'lastWeek': instance.lastWeek,
    };
