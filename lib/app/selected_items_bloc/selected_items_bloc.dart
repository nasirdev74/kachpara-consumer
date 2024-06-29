import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/payment_usecase.dart';

import '../../domain/entities/address.dart';
import '../../domain/entities/payment_card.dart';
import '../../domain/usecases/address_usecase.dart';

part 'selected_items_event.dart';
part 'selected_items_state.dart';
part 'selected_items_bloc.freezed.dart';

@lazySingleton
class SelectedItemsBloc extends Bloc<SelectedItemsEvent, SelectedItemsState> {
  SelectedItemsBloc(this._addressUseCases, this._paymentUsecases) : super(const SelectedItemsState()) {
    on<_SetAddress>(_onSetAddress);
    on<_SetPaymentMethod>(_onSetPaymentMethod);
    on<_InitializeAddress>(_onInitializeAddress);
    on<_InitializePaymentMethod>(_onInitializePaymentMethod);
  }
  final AddressUseCases _addressUseCases;
  final PaymentUsecases _paymentUsecases;

  FutureOr<void> _onSetAddress(_SetAddress event, Emitter<SelectedItemsState> emit) {
    emit(state.copyWith(selectedAddress: event.address));
  }

  FutureOr<void> _onSetPaymentMethod(_SetPaymentMethod event, Emitter<SelectedItemsState> emit) {
    emit(state.copyWith(selectedPaymentMethod: event.paymentMethod));
  }

  FutureOr<void> _onInitializeAddress(_InitializeAddress event, Emitter<SelectedItemsState> emit) async {
    final result = await _addressUseCases.getSelectedAddress();
    result.when(success: (addresss) {
      if (addresss == null) return;
      emit(state.copyWith(selectedAddress: addresss));
    }, error: (error) {
      debugPrint(error.toString());
    });
  }

  FutureOr<void> _onInitializePaymentMethod(_InitializePaymentMethod event, Emitter<SelectedItemsState> emit) async {
    final result = await _paymentUsecases.getSelectedPaymentMethod();
    result.when(success: (paymentMethod) {
      if (paymentMethod == null) return;
      emit(state.copyWith(selectedPaymentMethod: paymentMethod));
    }, error: (error) {
      debugPrint(error.toString());
    });
  }
}
