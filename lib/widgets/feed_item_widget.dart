import 'package:flutter/material.dart';
import 'package:kachpara/domain/entities/feed_item.dart';

class FeedItemWidget extends StatelessWidget {
  final FeedItem feedItem;

  final Function(ActionType, Map<String, dynamic>) onActionTypeTap;

  const FeedItemWidget({
    super.key,
    required this.feedItem,
    required this.onActionTypeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 8.0),
            _buildPostView(context, feedItem.id, feedItem.storeId, feedItem),
            const SizedBox(height: 8.0),
            _buildActionTypeChips(feedItem.storeId, feedItem.storeId, feedItem.orderId),
            const SizedBox(height: 8.0),
            _buildShareButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          feedItem.posterId,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          _formatTimestamp(feedItem.timestamp),
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildPostView(BuildContext context, id, String storeId, FeedItem feedItem) {
    Widget postView;

    postView = const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _buildUserTypeChips(),
        SizedBox(height: 8.0),
      ],
    );

    if (feedItem.feedType == FeedType.ClaimFreeProduct) {
      postView = Column(
        children: [
          postView,
          _buildGiftPostView(id, context),
        ],
      );
    } else if (feedItem.feedType == FeedType.PlaceOrder) {
      postView = Column(
        children: [
          postView,
          _buildOrderPostView(id, context),
        ],
      );
    } else if (feedItem.feedType == FeedType.StoreAddition) {
      postView = Column(
        children: [
          _buildAddStorePostView(storeId, context),
          postView,
        ],
      );
    }

    return postView;
  }

  Widget _buildActionTypeChips(String storeId, String? code, String? orderId) {
    return Wrap(
      spacing: 4.0,
      children: feedItem.actionType.map((actionType) {
        return GestureDetector(
          onTap: () => onActionTypeTap(actionType, {
            'storeId': storeId,
            'code': code,
            'orderId': orderId,
          }),
          child: Chip(
            label: Text(
              actionType.toString().split('.').last,
              style: const TextStyle(
                  // color: Colors.black,
                  ),
            ),
            // backgroundColor: Colors.blue,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGiftPostView(String id, BuildContext context) {
    return Text(feedItem.content);
  }

  Widget _buildOrderPostView(String id, BuildContext context) {
    return Text(feedItem.content);
  }

  Widget _buildAddStorePostView(String storeId, BuildContext context) {
    return Text(feedItem.content);
  }

  Widget _buildShareButtons() {
    return const Icon(Icons.share);
  }

  String _formatTimestamp(DateTime timestamp) {
    return "${timestamp.hour}:${timestamp.minute} - ${timestamp.day}/${timestamp.month}/${timestamp.year}";
  }
}
