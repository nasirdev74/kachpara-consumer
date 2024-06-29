// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurationImpl _$$CurationImplFromJson(Map<String, dynamic> json) =>
    _$CurationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      ownerUserId: json['ownerUserId'] as String,
      referralCode: json['referralCode'] as String,
      curatorName: json['curatorName'] as String?,
      domain: json['domain'] as String?,
      stores:
          (json['stores'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      imageFileName: json['imageFileName'] as String?,
    );

Map<String, dynamic> _$$CurationImplToJson(_$CurationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerUserId': instance.ownerUserId,
      'referralCode': instance.referralCode,
      'curatorName': instance.curatorName,
      'domain': instance.domain,
      'stores': instance.stores,
      'description': instance.description,
      'imageFileName': instance.imageFileName,
    };
