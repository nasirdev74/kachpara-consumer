part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.addToCart(Cart cart) = _AddToCart;
  const factory CartEvent.removeFromCart(int productId) = _RemoveFromCart;
  const factory CartEvent.decreaseQuantity(int cartItemId) = _DecreaseQuantity;
  const factory CartEvent.incrementQuantity(int cartItemId) = _IncrementQuantity;

  const factory CartEvent.clearCart() = _ClearCart;
  const factory CartEvent.getCart() = _GetCart;
}
