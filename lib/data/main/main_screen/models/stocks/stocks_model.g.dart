// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockModel _$StockModelFromJson(Map<String, dynamic> json) => StockModel(
      storeName: json['storeName'] as String,
      productName: json['productName'] as String,
      storesProductId: (json['storesProductId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$StockModelToJson(StockModel instance) =>
    <String, dynamic>{
      'storeName': instance.storeName,
      'productName': instance.productName,
      'storesProductId': instance.storesProductId,
      'quantity': instance.quantity,
    };
