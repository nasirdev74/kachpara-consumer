part of 'promotions_page_cubit.dart';

@freezed
class PromotionsPageState with _$PromotionsPageState {
  const factory PromotionsPageState({
    @Default(Status.init) Status getPromotionsStatus,
    @Default([]) List<Promotion> promotions,
    String? getPromotionsErrorMessage,
  }) = _PromotionsPageState;
}
