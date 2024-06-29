// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      currency: json['currency'] as String?,
      currencySymbol: json['currencySymbol'] as String?,
      storeId: json['storeId'] as String,
      storeName: json['storeName'] as String,
      orderStatus: json['orderStatus'] as String,
      address: json['address'] as String,
      notes: json['notes'] as String?,
      curationId: json['curationId'] as String?,
      giftTo: json['giftTo'] as String?,
      product: (json['product'] as List<dynamic>)
          .map((e) => OrderProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      paymentIntentId: json['paymentIntentId'] as String?,
      pickupAddress: json['pickupAddress'] as String?,
      isDelivery: json['isDelivery'] as bool,
      isPickup: json['isPickup'] as bool,
      deliveryTime:
          const TimestampConverter().fromJson(json['deliveryTime'] as String),
      pickupTime:
          const TimestampConverter().fromJson(json['pickupTime'] as String),
      orderPlacementTime: const TimestampConverter()
          .fromJson(json['orderPlacementTime'] as String),
      useRewardPoints: json['useRewardPoints'] as bool? ?? false,
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'currency': instance.currency,
      'currencySymbol': instance.currencySymbol,
      'storeId': instance.storeId,
      'storeName': instance.storeName,
      'orderStatus': instance.orderStatus,
      'address': instance.address,
      'notes': instance.notes,
      'curationId': instance.curationId,
      'giftTo': instance.giftTo,
      'product': productsToJson(instance.product),
      'totalAmount': instance.totalAmount,
      'paymentIntentId': instance.paymentIntentId,
      'pickupAddress': instance.pickupAddress,
      'isDelivery': instance.isDelivery,
      'isPickup': instance.isPickup,
      'deliveryTime': const TimestampConverter().toJson(instance.deliveryTime),
      'pickupTime': const TimestampConverter().toJson(instance.pickupTime),
      'orderPlacementTime':
          const TimestampConverter().toJson(instance.orderPlacementTime),
      'useRewardPoints': instance.useRewardPoints,
    };
