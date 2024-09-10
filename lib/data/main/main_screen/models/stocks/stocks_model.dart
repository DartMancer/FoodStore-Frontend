import 'package:json_annotation/json_annotation.dart';

part 'stocks_model.g.dart';

@JsonSerializable()
class StockModel {
  StockModel({
    required this.storeName,
    required this.productName,
    required this.storesProductId,
    required this.quantity,
  });

  final String storeName, productName;
  final int storesProductId, quantity;

  factory StockModel.fromJson(Map<String, dynamic> json) =>
      _$StockModelFromJson(json);

  Map<String, dynamic> toJson() => _$StockModelToJson(this);
}
