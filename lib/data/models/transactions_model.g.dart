// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionsModelImpl _$$TransactionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionsModelImpl(
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TransactionsModelImplToJson(
        _$TransactionsModelImpl instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
    };
