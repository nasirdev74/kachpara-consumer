part of 'leaderboard_page_cubit.dart';

@freezed
class LeaderboardPageState with _$LeaderboardPageState {
  const factory LeaderboardPageState({
    final Map<User, UserStore>? stores,
    @Default(Status.init) Status fetchLeaderboardStatus,
  }) = _LeaderboardPageState;
}
