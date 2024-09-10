import 'package:json_annotation/json_annotation.dart';

part 'hourly_sales_model.g.dart';

@JsonSerializable()
class HourlySalesModel {
  HourlySalesModel({
    required this.hour,
    required this.todaySales,
    required this.yesterdaySales,
    required this.lastWeekSales,
  });

  final int hour;
  final double todaySales;
  final double yesterdaySales;
  final double lastWeekSales;

  factory HourlySalesModel.fromJson(Map<String, dynamic> json) =>
      _$HourlySalesModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourlySalesModelToJson(this);
}
