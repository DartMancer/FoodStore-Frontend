import 'package:food_store/data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_summary_model.g.dart';

@JsonSerializable()
class DailySummaryModel extends SalesSummaryModel {
  DailySummaryModel({
    required super.totalSales,
    required super.totalUnits,
  });

  factory DailySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$DailySummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailySummaryModelToJson(this);
}
