part of 'claim_gift_page_cubit.dart';

@freezed
class ClaimGiftPageState with _$ClaimGiftPageState {
  const factory ClaimGiftPageState(
      {@Default(Status.init) Status getOrderState,
      @Default(Status.init) Status claimPageStatus,
      @Default(false) bool isNearStoreStatus,
      Store? store,
      Order? order,
      String? orderId}) = _ClaimGiftPageState;
}
