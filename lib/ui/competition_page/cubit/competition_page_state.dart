part of 'competition_page_cubit.dart';

@freezed
class CompetitionPageState with _$CompetitionPageState {
  const factory CompetitionPageState({
    final Competition? competition,
    final Map<String, String>? userNames, // Add this line
    @Default(Status.init) Status fetchCompetitionStatus,
  }) = _CompetitionPageState;
}
