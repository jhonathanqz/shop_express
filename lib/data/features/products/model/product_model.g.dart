// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return ProductModel(
    title: json['title'] as String?,
    type: json['type'] as String?,
    filename: json['filename'] as String?,
    description: json['description'] as String?,
    height: (json['height'] as num?)?.toDouble(),
    width: (json['width'] as num?)?.toDouble(),
    price: (json['price'] as num?)?.toDouble(),
    rating: json['rating'] as int?,
  );
}

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'description': instance.description,
      'filename': instance.filename,
      'height': instance.height,
      'width': instance.width,
      'price': instance.price,
      'rating': instance.rating,
    };
