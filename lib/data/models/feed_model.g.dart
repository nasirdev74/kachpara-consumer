// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedModelImpl _$$FeedModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedModelImpl(
      postedByStore: json['postedByStore'] as bool?,
      storeName: json['storeName'] as String?,
      sender: json['sender'] as String?,
      reciever: json['reciever'] as String?,
      orderId: json['orderId'] as String?,
      contentUrl: (json['contentUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      feedType: $enumDecode(_$FeedTypeEnumMap, json['feedType']),
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      storeId: json['storeId'] as String,
      id: json['id'] as String,
      posterId: json['posterId'] as String,
      content: json['content'] as String,
      timeStamp: json['timeStamp'] as String,
      actionType: (json['actionType'] as List<dynamic>)
          .map((e) => $enumDecode(_$ActionTypeEnumMap, e))
          .toList(),
      ownerId: json['ownerId'] as String,
      audienceIds: (json['audienceIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$FeedModelImplToJson(_$FeedModelImpl instance) =>
    <String, dynamic>{
      'postedByStore': instance.postedByStore,
      'storeName': instance.storeName,
      'sender': instance.sender,
      'reciever': instance.reciever,
      'orderId': instance.orderId,
      'contentUrl': instance.contentUrl,
      'feedType': _$FeedTypeEnumMap[instance.feedType]!,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'storeId': instance.storeId,
      'id': instance.id,
      'posterId': instance.posterId,
      'content': instance.content,
      'timeStamp': instance.timeStamp,
      'actionType':
          instance.actionType.map((e) => _$ActionTypeEnumMap[e]!).toList(),
      'ownerId': instance.ownerId,
      'audienceIds': instance.audienceIds,
    };

const _$FeedTypeEnumMap = {
  FeedType.StoreAddition: 'StoreAddition',
  FeedType.ClaimFreeProduct: 'ClaimFreeProduct',
  FeedType.PlaceOrder: 'PlaceOrder',
};

const _$UserTypeEnumMap = {
  UserType.User: 'User',
  UserType.SharedContact: 'SharedContact',
  UserType.Referral: 'Referral',
};

const _$ActionTypeEnumMap = {
  ActionType.ViewStoreDetails: 'ViewStoreDetails',
  ActionType.ViewRewardPage: 'ViewRewardPage',
  ActionType.AddStore: 'AddStore',
  ActionType.ViewOrderDetails: 'ViewOrderDetails',
};
