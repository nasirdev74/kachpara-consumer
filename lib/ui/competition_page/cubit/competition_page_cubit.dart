import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/competition.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/status.dart';

part 'competition_page_cubit.freezed.dart';
part 'competition_page_state.dart';

@injectable
class CompetitionPageCubit extends Cubit<CompetitionPageState> {
  CompetitionPageCubit(this._storeUsecase, this._userUseCase, @factoryParam this._storeId) : super(const CompetitionPageState()) {
    _initialize();
  }
  final StoreUsecase _storeUsecase;
  final UserUseCase _userUseCase;
  final String _storeId;
  void _initialize() async {
    try {
      emit(state.copyWith(fetchCompetitionStatus: Status.loading));

      final competition = await _storeUsecase.getCurrentCompetition(_storeId);
      // Extract user IDs from the competition data
      final userIDs = competition!.outreach.keys.toList();

      // Fetch user names asynchronously
      final userNames = await _fetchUserNames(userIDs);

      // final userIds = usersByStore.keys.toList();
      // final users = await _userUseCase.getUsers(userIds);

      // Process the data as needed
      // For example, you can emit a new state with the retrieved users
      emit(state.copyWith(
        fetchCompetitionStatus: Status.success,
        competition: competition,
        userNames: userNames,
      ));
    } catch (e) {
      // Handle exceptions if any occurred during data retrieval
      emit(state.copyWith(fetchCompetitionStatus: Status.failed));
    }
  }

  Future<Map<String, String>> _fetchUserNames(List<String> userIds) async {
    final Map<String, String> userNames = {};

    for (final userId in userIds) {
      final user = await _userUseCase.getUser(userId);
      userNames[userId] = user?.name ?? "";
    }

    return userNames;
  }
}
