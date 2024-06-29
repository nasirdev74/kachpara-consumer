// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum FeedType {
  StoreAddition,
  ClaimFreeProduct,
  PlaceOrder,
}

enum UserType {
  User,
  SharedContact,
  Referral,
}

enum ActionType {
  ViewStoreDetails,
  ViewRewardPage,
  AddStore,
  ViewOrderDetails,
}

class FeedItem extends Equatable {
  final bool? postedByStore;

  final FeedType feedType;
  final String storeId;
  final String id;
  final String? storeName;
  final String? orderId;
  final String? sender;
  final String? reciever;
  final String posterId;
  final List<String>? contentUrl;
  final String content;
  final DateTime timestamp;
  final List<ActionType> actionType;
  final UserType userType;
  final String ownerId;
  final List<String> audienceIds;

  const FeedItem({
    this.postedByStore,
    this.storeName,
    this.contentUrl,
    this.sender,
    this.reciever,
    this.orderId,
    required this.actionType,
    required this.userType,
    required this.id,
    required this.feedType,
    required this.storeId,
    required this.posterId,
    required this.content,
    required this.timestamp,
    required this.ownerId,
    required this.audienceIds,
  });

  @override
  List<Object?> get props => [
        ownerId,
        orderId,
        userType,
        id,
        audienceIds,
        sender,
        reciever,
        contentUrl,
        storeName,
        postedByStore,
        feedType,
        storeId,
        posterId,
        content,
        timestamp,
      ];
}
