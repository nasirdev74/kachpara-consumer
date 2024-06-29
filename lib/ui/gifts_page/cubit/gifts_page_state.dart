part of 'gifts_page_cubit.dart';

@freezed
class GiftsPageState with _$GiftsPageState {
  const factory GiftsPageState({
    @Default(Status.init) Status giftsStatus,
    @Default([]) List<Gift> gifts,
  }) = _GiftsPageState;
}
