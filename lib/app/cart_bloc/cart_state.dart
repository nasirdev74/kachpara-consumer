part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState(
      {Cart? cart,
      @Default(Status.init) Status addToCartStatus,
      @Default(Status.init) Status removeFromCartStatus,
      @Default(Status.init) Status clearCartStatus,
      @Default(Status.init) Status increaseQuantityStatus,
      @Default(Status.init) Status decreaseQuantityStatus,
      int? updatingCartItemId}) = _CartState;
}
