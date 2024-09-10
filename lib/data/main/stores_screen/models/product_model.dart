import 'package:json_annotation/json_annotation.dart';
import 'manufacturer_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel({
    required this.id,
    required this.productName,
    required this.manufacturer,
    required this.unit,
  });

  final int id;
  final String productName;
  final ManufacturerModel manufacturer;
  final String unit;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
