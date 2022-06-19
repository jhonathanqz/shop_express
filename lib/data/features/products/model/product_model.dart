import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'filename')
  final String? filename;
  @JsonKey(name: 'height')
  final double? height;
  @JsonKey(name: 'width')
  final double? width;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'rating')
  final int? rating;

  ProductModel({
    this.title,
    this.type,
    this.filename,
    this.description,
    this.height,
    this.width,
    this.price,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String?, dynamic> toJson() => _$ProductModelToJson(this);
}
