// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RewardBalanceModelImpl _$$RewardBalanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RewardBalanceModelImpl(
      storeId: json['storeId'] as String,
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$$RewardBalanceModelImplToJson(
        _$RewardBalanceModelImpl instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'balance': instance.balance,
    };
