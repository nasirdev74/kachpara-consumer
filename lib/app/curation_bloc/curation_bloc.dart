import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/curation_usecase.dart';

import '../../domain/entities/curation.dart';
import '../../utils/status.dart';

part 'curation_bloc_event.dart';
part 'curation_bloc_state.dart';
part 'curation_bloc.freezed.dart';

@singleton
class CurationBloc extends Bloc<CurationBlocEvent, CurationBlocState> {
  CurationBloc(this._curationUsecase) : super(const CurationBlocState()) {
    on<_GetCurations>(onGetCurations);
    on<_Added>(_onAdded);
    on<_Deleted>(_onDeleted);
  }

  final CurationUsecase _curationUsecase;

  FutureOr<void> onGetCurations(event, Emitter<CurationBlocState> emit) async {
    emit(state.copyWith(getCurationsStatus: Status.loading));
    if (kDebugMode) {
      print("Get curations event called");
    }
    final result = await _curationUsecase.getCurations();
    result.when(success: (data) {
      emit(state.copyWith(getCurationsStatus: Status.success, curations: data));
    }, error: (error) {
      emit(state.copyWith(getCurationsStatus: Status.failed));
    });
  }

  FutureOr<void> _onAdded(_Added event, Emitter<CurationBlocState> emit) async {
    if (state.curations.contains(event.curation)) {
      return;
    }
    final List<Curation> curations = List.from(state.curations)..add(event.curation);
    emit(state.copyWith(getCurationsStatus: Status.success, curations: curations));
  }

  FutureOr<void> _onDeleted(_Deleted event, Emitter<CurationBlocState> emit) {
    final List<Curation> curations = List.from(state.curations)..removeWhere((element) => element.id == event.curation.id);
    emit(state.copyWith(getCurationsStatus: Status.success, curations: curations));
  }
}
