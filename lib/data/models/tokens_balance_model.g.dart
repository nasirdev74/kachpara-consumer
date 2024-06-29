// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokensBalanceModelImpl _$$TokensBalanceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TokensBalanceModelImpl(
      tokens: (json['tokens'] as List<dynamic>?)
              ?.map((e) => TokenBalance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TokensBalanceModelImplToJson(
        _$TokensBalanceModelImpl instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
    };
