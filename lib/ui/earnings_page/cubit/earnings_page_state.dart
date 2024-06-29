part of 'earnings_page_cubit.dart';

@freezed
class EarningsPageState with _$EarningsPageState {
  const factory EarningsPageState({
    @Default(Status.init) Status getEarningsStatus,
    @Default([]) List<Earnings> earnings,
    @Default(0) double balance,
    @Default(Status.init) Status getRewardUsagesStatus,
    @Default([]) List<RewardUsage> rewardUsages,
  }) = _earningsPageState;
}
