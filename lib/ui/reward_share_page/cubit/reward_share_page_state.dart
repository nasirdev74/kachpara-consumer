part of 'reward_share_page_cubit.dart';

@freezed
class RewardSharePageState with _$RewardSharePageState {
  const factory RewardSharePageState({
    Store? store,
    UserStore? userStore,
    @Default(Status.init) Status getRewardStatus,
    String? error,
  }) = _RewardSharePageState;
}
