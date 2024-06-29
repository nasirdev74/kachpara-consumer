import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/store_model.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/utils/status.dart';

part 'store_details_page_state.dart';
part 'store_details_page_cubit.freezed.dart';

@injectable
class StoreDetailsPageCubit extends Cubit<StoreDetailsPageState> {
  StoreDetailsPageCubit(
    @factoryParam this.storeId,
    this._storeUsecase,
  ) : super(const StoreDetailsPageState());

  final String storeId;
  final StoreUsecase _storeUsecase;

  Future<void> getStoreDetailsById() => _storeUsecase.getStoreById(storeId: storeId).then((result) {
        result.when(
          success: (store) => emit(state.copyWith(status: Status.success, store: store)),
          error: (error) => emit(state.copyWith(status: Status.failed)),
        );
      });

  Future<void> updateStoreData({
    required StoreModel store,
  }) async {
    await _storeUsecase.updateStore(store: store);
  }
}
