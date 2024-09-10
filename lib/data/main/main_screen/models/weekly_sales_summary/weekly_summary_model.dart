import 'package:food_store/data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weekly_summary_model.g.dart';

@JsonSerializable()
class WeeklySummaryModel extends SalesSummaryModel {
  WeeklySummaryModel({
    required super.totalSales,
    required super.totalUnits,
  });

  factory WeeklySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$WeeklySummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeeklySummaryModelToJson(this);
}
