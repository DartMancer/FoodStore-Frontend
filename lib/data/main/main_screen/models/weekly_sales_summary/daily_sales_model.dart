import 'package:json_annotation/json_annotation.dart';

part 'daily_sales_model.g.dart';

@JsonSerializable()
class DailySalesModel {
  DailySalesModel({
    required this.day,
    required this.date,
    required this.thisWeek,
    required this.lastWeek,
  });

  final String day;
  final DateTime date;
  final double thisWeek;
  final double lastWeek;

  factory DailySalesModel.fromJson(Map<String, dynamic> json) =>
      _$DailySalesModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailySalesModelToJson(this);
}
