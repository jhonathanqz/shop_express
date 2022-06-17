import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Product extends Equatable {
  final int uuid;
  final String title;
  final String description;
  final String type;
  final String fileName;
  final double height;
  final double width;
  final double price;
  final int rating;

  const Product({
    required this.uuid,
    required this.title,
    required this.description,
    required this.type,
    required this.fileName,
    required this.height,
    required this.width,
    required this.price,
    required this.rating,
  });

  Product copyWith({
    int? uuid,
    String? title,
    String? description,
    String? type,
    String? fileName,
    double? height,
    double? width,
    double? price,
    int? rating,
  }) =>
      Product(
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
        description: description ?? this.description,
        type: type ?? this.type,
        fileName: fileName ?? this.fileName,
        height: height ?? this.height,
        width: width ?? this.width,
        price: price ?? this.price,
        rating: rating ?? this.rating,
      );

  @override
  List<Object?> get props => [
        uuid,
        title,
        description,
        type,
        fileName,
        height,
        width,
        price,
        rating,
      ];
}
