part of 'add_address_page_cubit.dart';

@freezed
class AddAddressPageState with _$AddAddressPageState {
  const factory AddAddressPageState({
    @Default(Status.init) Status status,
    String? error,
  }) = _AddAddressPageState;
}
