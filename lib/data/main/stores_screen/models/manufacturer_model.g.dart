// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manufacturer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ManufacturerModel _$ManufacturerModelFromJson(Map<String, dynamic> json) =>
    ManufacturerModel(
      id: (json['id'] as num).toInt(),
      manufacturerName: json['manufacturerName'] as String,
      address: json['address'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$ManufacturerModelToJson(ManufacturerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'manufacturerName': instance.manufacturerName,
      'address': instance.address,
      'isActive': instance.isActive,
    };
