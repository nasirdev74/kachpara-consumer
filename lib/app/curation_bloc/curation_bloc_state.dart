part of 'curation_bloc.dart';

@freezed
class CurationBlocState with _$CurationBlocState {
  const factory CurationBlocState({
    @Default(<Curation>[]) List<Curation> curations,
    @Default(Status.init) Status getCurationsStatus,
  }) = _CurationBlocState;
}
