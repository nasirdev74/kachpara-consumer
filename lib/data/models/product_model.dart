// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required int id,
    required String name,
    required String price,
    @JsonKey(name: 'image_file_name') String? imageFileName,
    String? description,
    String? measure,
    String? currency,
    String? promotionId,
    @JsonKey(name: 'price_with_sign') String? priceWithSign,
  }) = _Product;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Product toDomain() {
    return Product(
      id: id,
      name: name,
      price: double.tryParse(price.toString()) ?? 0.0,
      imageFileName: imageFileName,
      description: description,
      measure: measure,
      currency: currency,
      priceWithSign: priceWithSign,
      promotionId: promotionId,
    );
  }

  factory ProductModel.fromDomain(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      price: product.price.toString(),
      imageFileName: product.imageFileName,
      description: product.description,
      measure: product.measure,
      currency: product.currency,
      priceWithSign: product.priceWithSign,
      promotionId: product.promotionId,
    );
  }
}
