// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreImpl _$$StoreImplFromJson(Map<String, dynamic> json) => _$StoreImpl(
      id: json['id'] as String,
      kachparaEnabled: json['kachparaEnabled'] as bool?,
      orderEnabled: json['orderEnabled'] as bool?,
      currency: json['currency'] as String,
      currencySymbol: json['currencySymbol'] as String,
      firstPurchaseReward: json['firstPurchaseReward'] as int?,
      addStoreReward: json['addStoreReward'] as int?,
      facebook: json['facebook'] as String?,
      twitter: json['twitter'] as String?,
      whatsapp: json['whatsapp'] as String?,
      isRewardEnabled: json['isRewardEnabled'] as bool?,
      isLoyaltyEnabled: json['isLoyaltyEnabled'] as bool?,
      isCompetitionEnabled: json['isCompetitionEnabled'] as bool?,
      youtube: json['youtube'] as String?,
      name: json['name'] as String,
      referralCode: json['referralCode'] as String,
      storeUrl: json['storeUrl'] as String,
      googleMapsUrl: json['googleMapsUrl'] as String?,
      imageFileName: json['imageFileName'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      address: json['address'] as String,
      placeId: json['placeId'] as String?,
      visitsRewardTreshold: json['visitsRewardTreshold'] as int? ?? 100,
      visitsRewardDescription: json['visitsRewardDescription'] as String?,
      visitsRewardEarnedDescription:
          json['visitsRewardEarnedDescription'] as String?,
      adminUserIds: (json['adminUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StoreImplToJson(_$StoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kachparaEnabled': instance.kachparaEnabled,
      'orderEnabled': instance.orderEnabled,
      'currency': instance.currency,
      'currencySymbol': instance.currencySymbol,
      'firstPurchaseReward': instance.firstPurchaseReward,
      'addStoreReward': instance.addStoreReward,
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'whatsapp': instance.whatsapp,
      'isRewardEnabled': instance.isRewardEnabled,
      'isLoyaltyEnabled': instance.isLoyaltyEnabled,
      'isCompetitionEnabled': instance.isCompetitionEnabled,
      'youtube': instance.youtube,
      'name': instance.name,
      'referralCode': instance.referralCode,
      'storeUrl': instance.storeUrl,
      'googleMapsUrl': instance.googleMapsUrl,
      'imageFileName': instance.imageFileName,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'placeId': instance.placeId,
      'visitsRewardTreshold': instance.visitsRewardTreshold,
      'visitsRewardDescription': instance.visitsRewardDescription,
      'visitsRewardEarnedDescription': instance.visitsRewardEarnedDescription,
      'adminUserIds': instance.adminUserIds,
    };
