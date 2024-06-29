import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/address.dart';
import '../../../domain/usecases/address_usecase.dart';
import '../../../utils/status.dart';

part 'add_address_page_state.dart';
part 'add_address_page_cubit.freezed.dart';

@injectable
class AddAddressPageCubit extends Cubit<AddAddressPageState> {
  AddAddressPageCubit(this._addressUseCases) : super(const AddAddressPageState());

  final AddressUseCases _addressUseCases;

  Future<void> addAddress(Address address) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _addressUseCases.addAddress(address);
    result.when(success: (data) {
      debugPrint("Address added");
      emit(state.copyWith(status: Status.success));
    }, error: (error) {
      debugPrint("Error adding address $error");
      emit(state.copyWith(status: Status.failed, error: error));
    });
  }

  Future<void> updateAddress(Address address) async {
    emit(state.copyWith(status: Status.loading));
    final result = await _addressUseCases.updateAddress(address);
    result.when(success: (data) {
      emit(state.copyWith(status: Status.success));
    }, error: (error) {
      emit(state.copyWith(status: Status.failed, error: error));
    });
  }
}
