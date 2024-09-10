// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      id: (json['id'] as num).toInt(),
      storeName: json['storeName'] as String,
      storeLocation: json['location'] as String,
      productsCount: (json['productsCount'] as num).toInt(),
      openingTime: json['openingTime'] as String,
      closingTime: json['closingTime'] as String,
      productsList: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storeName': instance.storeName,
      'location': instance.storeLocation,
      'productsCount': instance.productsCount,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
      'products': instance.productsList,
    };
