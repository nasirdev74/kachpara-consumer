part of 'buy_gift_page_cubit.dart';

@freezed
class BuyGiftPageState with _$BuyGiftPageState {
  const factory BuyGiftPageState(
      {@Default(Status.init) Status buyGiftPageStatus,
      String? orderId,
      String? buyGiftPageError,
      Store? store,
      Promotion? freePromotion,
      User? user}) = _BuyGiftPageState;
}
