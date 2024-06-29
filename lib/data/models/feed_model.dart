import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kachpara/domain/entities/feed_item.dart';

part 'feed_model.freezed.dart';
part 'feed_model.g.dart';

@freezed
class FeedModel with _$FeedModel {
  FeedModel._();
  factory FeedModel({
    final bool? postedByStore,
    final String? storeName,
    final String? sender,
    final String? reciever,
    final String? orderId,
    final List<String>? contentUrl,
    required FeedType feedType,
    required UserType userType,
    required String storeId,
    required String id,
    required String posterId,
    required String content,
    required String timeStamp,
    required List<ActionType> actionType,
    required String ownerId,
    required List<String> audienceIds,
  }) = _FeedModel;
  factory FeedModel.fromJson(Map<String, dynamic> json) => _$FeedModelFromJson(json);

  factory FeedModel.fromDomain(FeedItem feedItem) {
    return FeedModel(
      audienceIds: feedItem.audienceIds,
      ownerId: feedItem.ownerId,
      storeName: feedItem.storeName,
      postedByStore: feedItem.postedByStore,
      contentUrl: feedItem.contentUrl,
      feedType: feedItem.feedType,
      userType: feedItem.userType,
      actionType: feedItem.actionType,
      storeId: feedItem.storeId,
      id: feedItem.id,
      orderId: feedItem.orderId,
      sender: feedItem.sender,
      reciever: feedItem.reciever,
      posterId: feedItem.posterId,
      content: feedItem.content,
      timeStamp: feedItem.timestamp.toIso8601String(),
    );
  }

  FeedItem toDomain() {
    return FeedItem(
      audienceIds: audienceIds,
      ownerId: ownerId,
      feedType: feedType,
      actionType: actionType,
      userType: userType,
      storeId: storeId,
      orderId: orderId,
      id: id,
      posterId: posterId,
      content: content,
      postedByStore: postedByStore,
      storeName: storeName,
      sender: sender,
      reciever: reciever,
      contentUrl: contentUrl,
      timestamp: DateTime.parse(timeStamp),
    );
  }
}
