import 'package:json_annotation/json_annotation.dart';

part 'manufacturer_model.g.dart';

@JsonSerializable()
class ManufacturerModel {
  ManufacturerModel({
    required this.id,
    required this.manufacturerName,
    required this.address,
    required this.isActive,
  });

  final int id;
  final String manufacturerName;
  final String address;
  final bool isActive;

  factory ManufacturerModel.fromJson(Map<String, dynamic> json) =>
      _$ManufacturerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ManufacturerModelToJson(this);
}
