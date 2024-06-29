// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      accountType: json['accountType'] as String? ?? "",
      address: json['address'] as String? ?? "",
      blockchain: json['blockchain'] as String? ?? "",
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
      custodyType: json['custodyType'] as String? ?? "",
      id: json['id'] as String? ?? "",
      refId: json['refId'] as String? ?? "",
      state: json['state'] as String? ?? "",
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      walletSetId: json['walletSetId'] as String? ?? "",
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'accountType': instance.accountType,
      'address': instance.address,
      'blockchain': instance.blockchain,
      'createDate': instance.createDate?.toIso8601String(),
      'custodyType': instance.custodyType,
      'id': instance.id,
      'refId': instance.refId,
      'state': instance.state,
      'updateDate': instance.updateDate?.toIso8601String(),
      'walletSetId': instance.walletSetId,
    };
