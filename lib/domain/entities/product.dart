import 'package:equatable/equatable.dart';
import 'package:kachpara/data/models/product_model.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final double price;
  final String? imageFileName;
  final String? description;
  final String? measure;
  final String? currency;
  final String? priceWithSign;
  final String? promotionId;

  const Product(
      {required this.id,
      required this.name,
      required this.price,
      this.imageFileName,
      this.description,
      this.measure,
      this.currency,
      this.priceWithSign,
      this.promotionId});

  @override
  List<Object?> get props => [id, name, price, imageFileName, description, measure, currency, priceWithSign, promotionId];

  factory Product.fromModel(ProductModel model) {
    return Product(
      id: model.id,
      name: model.name,
      price: double.parse(model.price),
      currency: model.currency,
      description: model.description,
      imageFileName: model.imageFileName,
      measure: model.measure,
      priceWithSign: model.priceWithSign,
      promotionId: model.promotionId,
    );
  }

  Product copyWith({
    int? id,
    String? name,
    double? price,
    String? imageFileName,
    String? description,
    String? measure,
    String? currency,
    String? priceWithSign,
    String? promotionId,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageFileName: imageFileName ?? this.imageFileName,
      description: description ?? this.description,
      measure: measure ?? this.measure,
      currency: currency ?? this.currency,
      priceWithSign: priceWithSign ?? this.priceWithSign,
      promotionId: promotionId ?? this.promotionId,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price']),
      imageFileName: json['image_file_name'],
      description: json['description'],
      measure: json['measure'],
      currency: json['currency'],
      priceWithSign: json['price_with_sign'],
      promotionId: json['promotionId'],
    );
  }
}
