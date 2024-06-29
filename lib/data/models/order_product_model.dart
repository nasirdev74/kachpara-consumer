import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/domain/entities/cart_item.dart';

import '../../domain/entities/product.dart';

part 'order_product_model.freezed.dart';
part 'order_product_model.g.dart';

@freezed
class OrderProductModel with _$OrderProductModel {
  OrderProductModel._();
  factory OrderProductModel({
    required int id,
    required int quantity,
    required String name,
    String? description,
    String? measure,
    String? image,
    String? priceWithSign,
    String? currency,
    required double price,
  }) = _OrderProductModel;

  factory OrderProductModel.fromJson(Map<String, dynamic> json) => _$OrderProductModelFromJson(json);

  factory OrderProductModel.fromCartItem(CartItem cartItem) => OrderProductModel(
        id: cartItem.product.id,
        quantity: cartItem.quantity,
        name: cartItem.product.name,
        description: cartItem.product.description,
        measure: cartItem.product.measure,
        price: cartItem.product.price,
        currency: cartItem.product.currency,
        priceWithSign: cartItem.product.priceWithSign,
        image: cartItem.product.imageFileName,
      );

  CartItem toCartItem() => CartItem(
        id: id,
        product: Product(
          id: id,
          name: name,
          description: description,
          measure: measure,
          price: price,
          currency: currency,
          priceWithSign: priceWithSign,
          imageFileName: image,
        ),
        quantity: quantity,
      );
}
