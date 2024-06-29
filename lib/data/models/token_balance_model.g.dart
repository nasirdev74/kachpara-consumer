// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenBalanceImpl _$$TokenBalanceImplFromJson(Map<String, dynamic> json) =>
    _$TokenBalanceImpl(
      amount: json['amount'] ?? '0',
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      token: json['token'] ?? const TokenModel(),
    );

Map<String, dynamic> _$$TokenBalanceImplToJson(_$TokenBalanceImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'updateDate': instance.updateDate?.toIso8601String(),
      'token': instance.token,
    };
