part of 'claim_free_promotion_page_cubit.dart';

@freezed
class ClaimFreePromotionPageState with _$ClaimFreePromotionPageState {
  const factory ClaimFreePromotionPageState(
      {@Default(Status.init) Status getOrderState,
      @Default(Status.init) Status claimPageStatus,
      @Default(false) bool isNearStoreStatus,
      @Default(false) bool isClaimStartedStatus,
      @Default(true) bool isClaimAnytime,
      @Default(false) bool isVerified,
      @Default(false) bool isStudentVerified,
      Promotion? promotion,
      Store? store,
      DateTime? nextAvailableDate,
      String? orderId}) = _ClaimFreePromotionPageState;
}
