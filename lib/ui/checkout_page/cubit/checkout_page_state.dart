part of 'checkout_page_cubit.dart';

@freezed
class CheckoutPageState with _$CheckoutPageState {
  const factory CheckoutPageState(
      {@Default(Status.init) Status checkoutStatus,
      String? checkoutError,
      required String storeId,
      Store? store,
      @Default([]) List<CartItem> cartItems,
      @Default(0.0) double total,
      @Default(0.0) double discount,
      @Default(0.0) double deliveryCharge,
      @Default(0.0) double subTotal,
      @Default(0.0) double balance,
      String? note,
      DateTime? receivingfoodTime,
      @Default(true) bool isDelivery,
      Promotion? promotion,
      Promotion? freePromotion,
      String? promotionErrorMessage,
      @Default(false) bool useRewardPoints,
      @Default(false) bool donationOnly,
      String? orderId}) = _CheckoutPageState;
}
