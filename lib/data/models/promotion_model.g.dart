// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromotionModelImpl _$$PromotionModelImplFromJson(Map<String, dynamic> json) =>
    _$PromotionModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      discountAmount: (json['discountAmount'] as num).toDouble(),
      type: json['type'] as String,
      orderLimit: json['orderLimit'] as int,
      minimumPurchaseAmount:
          (json['minimumPurchaseAmount'] as num?)?.toDouble(),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      startDate:
          const DateTimeConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const DateTimeConverter().fromJson(json['endDate'] as Timestamp?),
      storeName: json['storeName'] as String,
      currentSponsor: json['currentSponsor'] as String?,
      currentSponsorURL: json['currentSponsorURL'] as String?,
      storeId: json['storeId'],
      isEnabled: json['isEnabled'] as bool,
      claimBeginTime: json['claimBeginTime'] as int?,
      claimEndTime: json['claimEndTime'] as int?,
      isClaimAnytime: json['isClaimAnytime'] as bool?,
      beneficiaryList: (json['beneficiaryList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalDonations: json['totalDonations'] as int?,
      claimedDonations: json['claimedDonations'] as int?,
      waitPeriodInMinutes: json['waitPeriodInMinutes'] as int?,
    );

Map<String, dynamic> _$$PromotionModelImplToJson(
        _$PromotionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'discountAmount': instance.discountAmount,
      'type': instance.type,
      'orderLimit': instance.orderLimit,
      'minimumPurchaseAmount': instance.minimumPurchaseAmount,
      'products': instance.products,
      'startDate': const DateTimeConverter().toJson(instance.startDate),
      'endDate': const DateTimeConverter().toJson(instance.endDate),
      'storeName': instance.storeName,
      'currentSponsor': instance.currentSponsor,
      'currentSponsorURL': instance.currentSponsorURL,
      'storeId': instance.storeId,
      'isEnabled': instance.isEnabled,
      'claimBeginTime': instance.claimBeginTime,
      'claimEndTime': instance.claimEndTime,
      'isClaimAnytime': instance.isClaimAnytime,
      'beneficiaryList': instance.beneficiaryList,
      'totalDonations': instance.totalDonations,
      'claimedDonations': instance.claimedDonations,
      'waitPeriodInMinutes': instance.waitPeriodInMinutes,
    };
