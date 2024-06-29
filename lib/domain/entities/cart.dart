import 'package:equatable/equatable.dart';
import 'package:kachpara/domain/entities/cart_item.dart';

class Cart extends Equatable {
  final String restaurantId;
  final String? curationId;

  final List<CartItem> items;

  const Cart({required this.restaurantId, required this.items, this.curationId});

  @override
  List<Object?> get props => [restaurantId, items, curationId];

  Cart copyWith({
    String? restaurantId,
    String? curationId,
    List<CartItem>? items,
  }) {
    return Cart(
      restaurantId: restaurantId ?? this.restaurantId,
      curationId: curationId ?? this.curationId,
      items: items ?? this.items,
    );
  }
}
