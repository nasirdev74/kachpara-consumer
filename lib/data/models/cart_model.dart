import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/cart.dart';
import 'cart_item_model.dart';

part 'cart_model.freezed.dart';

part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  const CartModel._();

  factory CartModel({
    required String restaurantId,
    String? curationId,
    required List<CartItemModel> items,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);

  Cart toDomain() {
    return Cart(
      restaurantId: restaurantId,
      curationId: curationId,
      items: items.map((e) => e.toDomain()).toList(),
    );
  }
}
