part of 'all_promotions_page_cubit.dart';

@freezed
class AllPromotionsPageState with _$AllPromotionsPageState {
  const factory AllPromotionsPageState({
    @Default(Status.init) Status getPromotionsStatus,
    @Default({}) Map<Store, List<Promotion>> promotions,
    String? getPromotionsErrorMessage,
  }) = _AllPromotionsPageState;
}
