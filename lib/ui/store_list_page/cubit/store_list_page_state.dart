part of 'store_list_page_cubit.dart';

@freezed
class StoreListPageState with _$StoreListPageState {
  const factory StoreListPageState({
    @Default(<Store>[]) List<Store> stores,
    @Default(Status.init) Status getStoresStatus,
  }) = _StoreListPageState;
}
