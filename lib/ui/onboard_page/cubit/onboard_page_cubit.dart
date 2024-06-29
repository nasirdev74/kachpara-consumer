import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/entities/user_store.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';

import '../../../utils/status.dart';

part 'onboard_page_state.dart';

part 'onboard_page_cubit.freezed.dart';

@injectable
class OnboardPageCubit extends Cubit<OnboardPageState> {
  OnboardPageCubit(this._storeUsecase, this._userUseCase, @factoryParam this.storeId) : super(const OnboardPageState()) {
    getReward();
  }

  final StoreUsecase _storeUsecase;
  final UserUseCase _userUseCase;
  final String storeId;

  Future<void> getReward() async {
    emit(state.copyWith(getRewardStatus: Status.loading));
    final userStore = await _userUseCase.getUserStore(storeId.toString());
    final result = await _storeUsecase.getStoreById(storeId: storeId);
    result.when(
        success: (store) => emit(state.copyWith(getRewardStatus: Status.success, store: store, userStore: userStore)),
        error: (e) => emit(state.copyWith(getRewardStatus: Status.failed)));
  }
}
