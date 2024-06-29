import 'package:equatable/equatable.dart';
import 'package:kachpara/domain/entities/product.dart';

class CartItem extends Equatable {
  final int id;
  final int quantity;
  final Product product;

  const CartItem({required this.quantity, required this.product, required this.id});
  @override
  List<Object?> get props => [id, quantity, product];

  CartItem copyWith({
    int? id,
    int? quantity,
    Product? product,
  }) {
    return CartItem(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      product: product ?? this.product,
    );
  }
}
