import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/data/models/product_model.dart';
import 'package:kachpara/domain/entities/product.dart';

import '../../domain/entities/category.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const CategoryModel._();
  const factory CategoryModel({
    required int id,
    required String name,
    required int? position,
    required List<ProductModel> products,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toCustomJson() => {
        'id': id,
        'items': products.map((e) => e.toJson()).toList(),
        'name': name,
        'position': position,
      };

  Category toDomain() {
    return Category(
      id: id,
      name: name,
      position: position,
      products: products.map((e) => Product.fromModel(e)).toList(),
    );
  }

  factory CategoryModel.fromDomain(Category category) {
    return CategoryModel(
      id: category.id,
      name: category.name,
      position: category.position,
      products: List<ProductModel>.from(category.products.map((e) => ProductModel.fromDomain(e))),
    );
  }
}
