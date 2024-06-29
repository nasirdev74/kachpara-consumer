import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/earnings.dart';
import '../../../domain/entities/reward_usage.dart';
import '../../../domain/usecases/auth_usecase.dart';
import '../../../domain/usecases/earnings_and_reward_usage.dart';
import '../../../utils/status.dart';

part 'earnings_page_state.dart';
part 'earnings_page_cubit.freezed.dart';

@injectable
class EarningsPageCubit extends Cubit<EarningsPageState> {
  EarningsPageCubit(this._earningsAndRewardUsagedata, this._authUseCase) : super(const EarningsPageState()) {
    getEarnings();
    getRewardUsages();
    _authUseCase.getCurrentUser();
  }

  final EaringsAndRewardUsageUseCase _earningsAndRewardUsagedata;
  final AuthUseCase _authUseCase;

  Future<void> getEarnings() async {
    emit(state.copyWith(getEarningsStatus: Status.loading));
    final result = await _earningsAndRewardUsagedata.getEarnings();
    result.when(success: (data) {
      emit(state.copyWith(getEarningsStatus: Status.success, earnings: data));
    }, error: (error) {
      emit(state.copyWith(
        getEarningsStatus: Status.failed,
      ));
    });
  }

  Future<void> getRewardUsages() async {
    emit(state.copyWith(getRewardUsagesStatus: Status.loading));
    final result = await _earningsAndRewardUsagedata.getRewardUsages();
    result.when(success: (data) {
      emit(state.copyWith(getRewardUsagesStatus: Status.success, rewardUsages: data));
    }, error: (error) {
      emit(state.copyWith(
        getRewardUsagesStatus: Status.failed,
      ));
    });
  }
}
