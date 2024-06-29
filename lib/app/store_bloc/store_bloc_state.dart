part of 'store_bloc.dart';

@freezed
class StoreBlocState with _$StoreBlocState {
  const factory StoreBlocState({
    @Default([]) List<Store> stores,
    @Default(Status.init) Status getStoresStatus,
    @Default(Status.init) Status addStoreStatus,
    String? errorMessage,
  }) = _StoreBlocState;
}
