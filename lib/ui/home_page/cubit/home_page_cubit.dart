import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/curation_bloc/curation_bloc.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/usecases/curation_usecase.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';

import '../../../domain/entities/curation.dart';
import '../../../domain/entities/store.dart';
import '../../../utils/status.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this._curationUsecase, this._storesUseCase) : super(const HomePageState());

  final CurationUsecase _curationUsecase;
  final StoreUsecase _storesUseCase;

  Future<void> deleteCuration(Curation curation) async {
    emit(state.copyWith(curationsStatus: Status.loading));
    final result = await _curationUsecase.deleteCuration(curation);
    result.when(success: (data) {
      getIt<CurationBloc>().add(CurationBlocEvent.deleted(curation: curation));
      emit(state.copyWith(
        curationsStatus: Status.success,
      ));
    }, error: (error) {
      emit(state.copyWith(curationsStatus: Status.failed));
    });
  }

  Future<void> deleteStore(Store store) async {
    // emit(state.copyWith(storesStatus: Status.loading));
    final result = await _storesUseCase.deleteStore(store: store);
    result.when(
        success: (data) {
          getIt<StoreBloc>().add(StoreBlocEvent.deleteStore(store));
          emit(state.copyWith());
        },
        error: (error) {});
  }
}
