import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/reward_balance.dart';

part 'reward_balance_model.freezed.dart';
part 'reward_balance_model.g.dart';

@freezed
class RewardBalanceModel with _$RewardBalanceModel {
  const RewardBalanceModel._();
  const factory RewardBalanceModel({
    required String storeId,
    required double balance,
  }) = _RewardBalanceModel;

  factory RewardBalanceModel.fromJson(Map<String, dynamic> json) => _$RewardBalanceModelFromJson(json);

  RewardBalance toDomain() {
    return RewardBalance(storeId: storeId, balance: balance);
  }

  factory RewardBalanceModel.fromDomain(RewardBalance rewardBalance) {
    return RewardBalanceModel(
      storeId: rewardBalance.storeId,
      balance: rewardBalance.balance,
    );
  }
}
