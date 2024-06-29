import 'package:equatable/equatable.dart';
import 'package:kachpara/domain/entities/product.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final int? position;
  final List<Product> products;

  const Category({
    required this.id,
    required this.name,
    required this.position,
    required this.products,
  });

  @override
  List<Object?> get props => [id, name, position, products];

  Category copyWith({
    int? id,
    String? name,
    int? restaurantId,
    int? position,
    List<Product>? products,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
      products: products ?? this.products,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    var productList = json['items'] as List<dynamic>;
    List<Product> products = productList.map((productJson) => Product.fromJson(productJson)).toList();

    return Category(id: json['id'], name: json['name'], position: json['position'], products: products);
  }
}
