import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/data/models/product_model.dart';
import 'package:kachpara/domain/entities/cart_item.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
class CartItemModel with _$CartItemModel {
  const CartItemModel._();

  const factory CartItemModel({
    required int id,
    required int quantity,
    @CartItemConverter() required ProductModel product,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      'product': product.toJson(),
    };
  }

  CartItem toDomain() {
    return CartItem(
      id: id,
      quantity: quantity,
      product: product.toDomain(),
    );
  }

  factory CartItemModel.fromDomain(CartItem cartItem) {
    final product = ProductModel.fromDomain(cartItem.product);
    print('product: $product');
    return CartItemModel(
      id: cartItem.id,
      quantity: cartItem.quantity,
      product: product,
    );
  }
}

class CartItemConverter implements JsonConverter<ProductModel, Map<String, dynamic>> {
  const CartItemConverter();

  @override
  Map<String, dynamic> toJson(ProductModel data) => data.toJson();

  @override
  ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }
}
