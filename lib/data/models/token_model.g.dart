// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenModelImpl _$$TokenModelImplFromJson(Map<String, dynamic> json) =>
    _$TokenModelImpl(
      id: json['id'] as String? ?? "",
      blockchain: json['blockchain'] as String? ?? "",
      name: json['name'] as String? ?? "",
      symbol: json['symbol'] as String? ?? "",
      decimals: json['decimals'] as int? ?? 0,
      isNative: json['isNative'] as bool? ?? false,
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      createDate: json['createDate'] == null
          ? null
          : DateTime.parse(json['createDate'] as String),
    );

Map<String, dynamic> _$$TokenModelImplToJson(_$TokenModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blockchain': instance.blockchain,
      'name': instance.name,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
      'isNative': instance.isNative,
      'updateDate': instance.updateDate?.toIso8601String(),
      'createDate': instance.createDate?.toIso8601String(),
    };
