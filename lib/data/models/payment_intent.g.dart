// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentIntentImpl _$$PaymentIntentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentIntentImpl(
      id: json['id'] as String,
      client_secret: json['client_secret'] as String,
      status: json['status'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$$PaymentIntentImplToJson(_$PaymentIntentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_secret': instance.client_secret,
      'status': instance.status,
      'amount': instance.amount,
      'currency': instance.currency,
    };
