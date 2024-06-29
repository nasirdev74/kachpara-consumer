import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/curation.dart';

import '../../../domain/entities/store.dart';
import '../../../domain/usecases/store_usecase.dart';
import '../../../utils/status.dart';

part 'store_list_page_state.dart';
part 'store_list_page_cubit.freezed.dart';

@injectable
class StoreListPageCubit extends Cubit<StoreListPageState> {
  StoreListPageCubit(
    this._storeUsecase,
  ) : super(const StoreListPageState());

  final StoreUsecase _storeUsecase;
  late final Curation _curation;

  void setCuration(Curation curation) {
    _curation = curation;
  }

  Future<void> getStores() async {
    emit(state.copyWith(getStoresStatus: Status.loading));
    final result = await _storeUsecase.getStoresByCurationId(_curation.id);
    result.when(success: (data) {
      emit(state.copyWith(
        getStoresStatus: Status.success,
        stores: data,
      ));
    }, error: (error) {
      emit(state.copyWith(getStoresStatus: Status.failed));
    });
  }
}
