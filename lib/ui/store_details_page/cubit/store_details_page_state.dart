part of 'store_details_page_cubit.dart';

@freezed
class StoreDetailsPageState with _$StoreDetailsPageState {
  const factory StoreDetailsPageState({
    @Default(Status.loading) Status status,
    @Default(null) Store? store,
  }) = _Initial;
}
