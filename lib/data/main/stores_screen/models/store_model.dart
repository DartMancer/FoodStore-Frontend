import 'package:food_store/data/main/stores_screen/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  StoreModel({
    required this.id,
    required this.storeName,
    required this.storeLocation,
    required this.productsCount,
    required this.openingTime,
    required this.closingTime,
    required this.productsList,
  });

  final int id;
  final String storeName;
  @JsonKey(name: 'location')
  final String storeLocation;
  final int productsCount;
  final String openingTime;
  final String closingTime;
  @JsonKey(name: 'products')
  final List<ProductModel> productsList;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
