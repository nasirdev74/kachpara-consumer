// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      shareableReferralCode: json['shareableReferralCode'] as String?,
      shareableReferralLink: json['shareableReferralLink'] as String?,
      shareablefreeProductLink: json['shareablefreeProductLink'] as String?,
      sourceReferralCode: json['sourceReferralCode'] as String,
      totalRewards: (json['totalRewards'] as num?)?.toDouble() ?? 0,
      totalOrders: json['totalOrders'] as int? ?? 0,
      totalStoreAdditions: json['totalStoreAdditions'] as int? ?? 0,
      currentVisits: json['currentVisits'] as int? ?? 0,
      totalVisits: json['totalVisits'] as int? ?? 0,
      outreach: (json['outreach'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      visits:
          (json['visits'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              const [],
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shareableReferralCode': instance.shareableReferralCode,
      'shareableReferralLink': instance.shareableReferralLink,
      'shareablefreeProductLink': instance.shareablefreeProductLink,
      'sourceReferralCode': instance.sourceReferralCode,
      'totalRewards': instance.totalRewards,
      'totalOrders': instance.totalOrders,
      'totalStoreAdditions': instance.totalStoreAdditions,
      'currentVisits': instance.currentVisits,
      'totalVisits': instance.totalVisits,
      'outreach': instance.outreach,
      'visits': instance.visits,
    };
