part of 'curation_detail_page_cubit.dart';

@freezed
class CurationDetailPageState with _$CurationDetailPageState {
  const factory CurationDetailPageState({
    Curation? curation,
    @Default(Status.init) Status fetchCurationStatus,
  }) = _CurationDetailPageState;
}
