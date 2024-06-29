import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/user_store.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/status.dart';

import '../../../domain/entities/user.dart';

part 'leaderboard_page_cubit.freezed.dart';
part 'leaderboard_page_state.dart';

@injectable
class LeaderboardPageCubit extends Cubit<LeaderboardPageState> {
  LeaderboardPageCubit(this._userUseCase, @factoryParam this._storeId) : super(const LeaderboardPageState()) {
    _initialize();
  }
  final UserUseCase _userUseCase;
  final String _storeId;
  void _initialize() async {
    try {
      emit(state.copyWith(fetchLeaderboardStatus: Status.loading));

      final usersByStore = await _userUseCase.getUsersByStoreId(_storeId);

      if (usersByStore != null && usersByStore.isNotEmpty) {
        // final userIds = usersByStore.keys.toList();
        // final users = await _userUseCase.getUsers(userIds);

        // Process the data as needed
        // For example, you can emit a new state with the retrieved users
        emit(state.copyWith(
          fetchLeaderboardStatus: Status.success,
          stores: usersByStore,
        ));
      } else {
        // Handle the case where data retrieval for usersByStoreId failed or returned null
        emit(state.copyWith(fetchLeaderboardStatus: Status.failed));
      }
    } catch (e) {
      // Handle exceptions if any occurred during data retrieval
      emit(state.copyWith(fetchLeaderboardStatus: Status.failed));
    }
  }
}
