part of 'address_list_page_cubit.dart';

@freezed
class AddressListPageState with _$AddressListPageState {
  const factory AddressListPageState({
    @Default(Status.init) Status getAddressesStatus,
    @Default([]) List<Address> addresses,
    String? getAddressesErrorMessage,
  }) = _AddressListPageState;
}
