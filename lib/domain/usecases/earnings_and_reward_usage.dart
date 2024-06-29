import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/earnings.dart';
import 'package:kachpara/utils/result.dart';

import '../../data/sources/firestore/earnings_and_reward_usage_data.dart';
import '../entities/reward_usage.dart';

@injectable
class EaringsAndRewardUsageUseCase {
  final EarningsAndRewardUsagedata _earningsAndRewardUsagedata;

  EaringsAndRewardUsageUseCase(this._earningsAndRewardUsagedata);

  Future<Result<List<Earnings>>> getEarnings() async {
    return await _earningsAndRewardUsagedata.getEarnings(getIt<UserBloc>().state.user!.id);
  }

  Future<Result<List<RewardUsage>>> getRewardUsages() async {
    return await _earningsAndRewardUsagedata.getRewardUsages(getIt<UserBloc>().state.user!.id);
  }
}
