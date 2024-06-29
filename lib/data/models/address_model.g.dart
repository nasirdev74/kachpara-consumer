// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      direction: json['direction'] as String?,
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'direction': instance.direction,
    };
