import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/earnings.dart';

import '../../../domain/entities/reward_usage.dart';
import '../../../utils/result.dart';

@injectable
class EarningsAndRewardUsagedata {
  EarningsAndRewardUsagedata(this._firestore);
  final FirebaseFirestore _firestore;

  Future<Result<List<RewardUsage>>> getRewardUsages(String userId) async {
    try {
      final rewardUsages = await _firestore.collection("users").doc(userId).collection("rewardUsages").get();
      return Result.success(rewardUsages.docs.map((e) => RewardUsage.fromJson(e.data())).toList());
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> addRewardUsage(String userId, RewardUsage rewardUsage) async {
    try {
      final id = _firestore.collection("users").doc(userId).collection("rewardUsages").doc().id;
      rewardUsage = rewardUsage.copyWith(id: id);
      await _firestore.collection("users").doc(userId).collection("rewardUsages").doc(rewardUsage.id.toString()).set(rewardUsage.toJson());
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<List<Earnings>>> getEarnings(String userId) async {
    try {
      final rewardUsages = await _firestore.collection("users").doc(userId).collection("rewardEarnings").get();
      return Result.success(rewardUsages.docs.map((e) => Earnings.fromJson(e.data())).toList());
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }
}
