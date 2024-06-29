import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/address_usecase.dart';
import 'package:kachpara/utils/status.dart';

import '../../../app/selected_items_bloc/selected_items_bloc.dart';
import '../../../core/injector.dart';
import '../../../domain/entities/address.dart';

part 'address_list_page_state.dart';
part 'address_list_page_cubit.freezed.dart';

@injectable
class AddressListPageCubit extends Cubit<AddressListPageState> {
  AddressListPageCubit(this._addressUseCases) : super(const AddressListPageState()) {
    getAddresses();
  }

  final AddressUseCases _addressUseCases;

  Future<void> getAddresses() async {
    emit(state.copyWith(getAddressesStatus: Status.loading));
    final result = await _addressUseCases.getAddresses();
    result.when(success: (data) {
      emit(state.copyWith(getAddressesStatus: Status.success, addresses: data));
    }, error: (error) {
      emit(state.copyWith(getAddressesStatus: Status.failed, getAddressesErrorMessage: error));
    });
  }

  Future<void> deleteAddress(Address address) async {
    await _addressUseCases.deleteAddress(address.id);
    getAddresses();
  }

  Future<void> setSelectedAddress(Address address) async {
    await _addressUseCases.setSelectedAddress(address.id);
    getIt<SelectedItemsBloc>().add(SelectedItemsEvent.setAddress(address: address));
  }
}
