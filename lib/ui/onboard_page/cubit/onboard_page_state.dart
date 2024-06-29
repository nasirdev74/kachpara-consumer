part of 'onboard_page_cubit.dart';

@freezed
class OnboardPageState with _$OnboardPageState {
  const factory OnboardPageState({
    Store? store,
    UserStore? userStore,
    @Default(Status.init) Status getRewardStatus,
    String? error,
  }) = _OnboardPageState;
}
