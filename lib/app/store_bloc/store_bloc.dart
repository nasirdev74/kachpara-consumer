import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/curation_usecase.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/utils/status.dart';

import '../../domain/entities/store.dart';

part 'store_bloc_event.dart';
part 'store_bloc_state.dart';
part 'store_bloc.freezed.dart';

@singleton
class StoreBloc extends Bloc<StoreBlocEvent, StoreBlocState> {
  StoreBloc(this._storeUsecase, this._curationUsecase) : super(const StoreBlocState()) {
    on<_GetStores>(onGetStores);
    on<_addStore>(onAddStore);
    on<_addStores>(onAddStores);
    on<_deleteStore>(onDeleteStore);
  }
  final StoreUsecase _storeUsecase;
  final CurationUsecase _curationUsecase;

  //merging both user stores and stores through list
  FutureOr<void> onGetStores(event, Emitter<StoreBlocState> emit) async {
    emit(state.copyWith(getStoresStatus: Status.loading));
    if (kDebugMode) {
      print("Get stores event called");
    }
    List<Store> stores = [];
    final result = await _storeUsecase.getStores();
    result.when(success: (data) {
      stores.addAll(data);
    }, error: (error) {
      emit(state.copyWith(getStoresStatus: Status.failed));
    });

    // final curations = await _curationUsecase.getCurations();

    // curations.when(
    //     success: (data) async {
    //       for (var i = 0; i < data.length; i++) {
    //         final curationStores =
    //             await _storeUsecase.getStoresByCurationId(data[i].id);
    //         curationStores.when(
    //             success: (data) {
    //               stores.addAll(data);
    //             },
    //             error: (error) {});
    //       }
    //     },
    //     error: (error) {});

    emit(state.copyWith(getStoresStatus: Status.success, stores: stores));
  }

  FutureOr<void> onAddStore(_addStore event, Emitter<StoreBlocState> emit) async {
    if (state.stores.contains(event.store)) {
      return;
    }
    final List<Store> list = List.from(state.stores)..add(event.store);
    emit(state.copyWith(getStoresStatus: Status.success, stores: list));
  }

  FutureOr<void> onAddStores(_addStores event, Emitter<StoreBlocState> emit) async {
    final List<Store> list = List.from(state.stores)..addAll(event.stores);
    emit(state.copyWith(getStoresStatus: Status.success, stores: list));
  }

  FutureOr<void> onDeleteStore(_deleteStore event, Emitter<StoreBlocState> emit) async {
    final List<Store> list = List.from(state.stores)..removeWhere((element) => element.id == event.store.id);
    emit(state.copyWith(getStoresStatus: Status.success, stores: list));
  }
}
