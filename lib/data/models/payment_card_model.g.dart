// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentCardModelImpl _$$PaymentCardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentCardModelImpl(
      id: _readId(json, 'id') as String,
      brand: _readBrand(json, 'brand') as String,
      last4: _readLast4(json, 'last4') as String,
      expMonth: _readExpMonth(json, 'expMonth') as int,
      expYear: _readExpYear(json, 'expYear') as int,
    );

Map<String, dynamic> _$$PaymentCardModelImplToJson(
        _$PaymentCardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'last4': instance.last4,
      'expMonth': instance.expMonth,
      'expYear': instance.expYear,
    };
