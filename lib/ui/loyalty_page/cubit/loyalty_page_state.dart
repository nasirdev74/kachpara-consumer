part of 'loyalty_page_cubit.dart';

@freezed
class LoyaltyPageState with _$LoyaltyPageState {
  const factory LoyaltyPageState({
    Store? store,
    UserStore? userStore,
    @Default(Status.init) Status getLoyaltyStatus,
    @Default(false) bool showSnackbar,
    String? error,
  }) = _LoyaltyPageState;
}
