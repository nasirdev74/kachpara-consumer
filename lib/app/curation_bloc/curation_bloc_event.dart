part of 'curation_bloc.dart';

@freezed
class CurationBlocEvent with _$CurationBlocEvent {
  const factory CurationBlocEvent.getCurations() = _GetCurations;
  const factory CurationBlocEvent.added({required Curation curation}) = _Added;
  const factory CurationBlocEvent.deleted({required Curation curation}) = _Deleted;
}
