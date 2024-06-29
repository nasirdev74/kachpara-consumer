part of 'store_bloc.dart';

@freezed
class StoreBlocEvent with _$StoreBlocEvent {
  const factory StoreBlocEvent.getStores() = _GetStores;
  const factory StoreBlocEvent.addStore(Store store) = _addStore;
  const factory StoreBlocEvent.addStores(List<Store> stores) = _addStores;
  const factory StoreBlocEvent.deleteStore(Store store) = _deleteStore;
}
