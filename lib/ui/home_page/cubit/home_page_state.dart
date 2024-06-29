part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(<Curation>[]) List<Curation> curations,
    @Default(Status.init) Status curationsStatus,
  }) = _HomePageState;
}
