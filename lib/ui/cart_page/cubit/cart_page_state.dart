part of 'cart_page_cubit.dart';

@freezed
class CartPageState with _$CartPageState {
  const factory CartPageState({
    @Default(Status.init) Status getCartStatus,
  }) = _CartPageState;
}
