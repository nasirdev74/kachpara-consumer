// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiftModelImpl _$$GiftModelImplFromJson(Map<String, dynamic> json) =>
    _$GiftModelImpl(
      type: json['type'] as String,
      senderUserId: json['senderUserId'] as String?,
      orderId: json['orderId'] as String,
      status: json['status'] as String,
      senderName: json['senderName'] as String?,
      giftDescription: json['giftDescription'] as String?,
    );

Map<String, dynamic> _$$GiftModelImplToJson(_$GiftModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'senderUserId': instance.senderUserId,
      'orderId': instance.orderId,
      'status': instance.status,
      'senderName': instance.senderName,
      'giftDescription': instance.giftDescription,
    };
