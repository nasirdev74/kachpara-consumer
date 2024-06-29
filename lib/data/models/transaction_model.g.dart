// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      id: json['id'] as String? ?? "",
      blockchain: json['blockchain'] as String? ?? "",
      tokenId: json['tokenId'] as String? ?? "",
      walletId: json['walletId'] as String? ?? "",
      sourceAddress: json['sourceAddress'] as String? ?? "",
      destinationAddress: json['destinationAddress'] as String? ?? "",
      transactionType: $enumDecodeNullable(
              _$TransactionTypeEnumMap, json['transactionType']) ??
          TransactionType.DUMMY,
      state: json['state'] as String? ?? "Pending",
      amounts: (json['amounts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["0"],
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      txHash: json['txHash'] as String? ?? "",
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blockchain': instance.blockchain,
      'tokenId': instance.tokenId,
      'walletId': instance.walletId,
      'sourceAddress': instance.sourceAddress,
      'destinationAddress': instance.destinationAddress,
      'transactionType': _$TransactionTypeEnumMap[instance.transactionType]!,
      'state': instance.state,
      'amounts': instance.amounts,
      'createDate': instance.createDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'txHash': instance.txHash,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.INBOUND: 'INBOUND',
  TransactionType.OUTBOUND: 'OUTBOUND',
  TransactionType.DUMMY: 'DUMMY',
};
