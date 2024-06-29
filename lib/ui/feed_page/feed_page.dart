import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/feed_item.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/order_detail_page/order_detail_page.dart';
import 'package:kachpara/ui/referral_code_entry_page/referral_code_entry_page.dart';
import 'package:kachpara/ui/reward_share_page/reward_share_page.dart';
import 'package:kachpara/ui/store_details_page/store_details_page.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/widgets/feed_item_widget.dart';

import 'cubit/feed_page_cubit.dart';

class FeedPage extends StatefulWidget {
  static const String routeName = 'feed_page';

  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FeedPageCubit>(),
      child: const FeedPageLayout(),
    );
  }
}

// FeedPageLayout.dart
class FeedPageLayout extends StatefulWidget {
  const FeedPageLayout({
    super.key,
  });

  @override
  State<FeedPageLayout> createState() => _FeedPageLayoutState();
}

class _FeedPageLayoutState extends State<FeedPageLayout> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<FeedPageCubit>().getFeed();
    }

    if (_scrollController.hasClients) {
      if (_scrollController.offset > 50) {
        setState(() {});
      } else {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FeedPageCubit, FeedPageState>(
      listener: (context, state) {
        if (state.status == Status.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.feed_page_error_fetching_feed),
            ),
          );
        }
      },
      child: BlocBuilder<FeedPageCubit, FeedPageState>(
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: Text(context.l10n.feed_page_title),
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  expandedHeight: 70.0,
                  flexibleSpace: const FlexibleSpaceBar(),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildFeedItem(index, state),
                    childCount:
                        state.feeds.length + (state.hasReachedEnd ? 0 : 1),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeedItem(int index, FeedPageState state) {
    if (index < state.feeds.length) {
      final feed = state.feeds[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FeedItemWidget(
          feedItem: feed,
          onActionTypeTap: (actionType, params) {
            switch (actionType) {
              case ActionType.ViewStoreDetails:
                context.pushNamed(StoreDetailsPage.routeName, queryParameters: {'storeId': params["storeId"]});
                break;
              case ActionType.ViewRewardPage:
                context.pushNamed(RewardSharePage.routeName,
                    queryParameters: {'storeId': params["storeId"]});
                break;
              case ActionType.AddStore:
                context.pushNamed(
                  ReferralCodeEntryPage.routeName,
                  extra: params["code"],
                );
                break;
              case ActionType.ViewOrderDetails:
                context.pushNamed(OrderDetailPage.routeName,
                    pathParameters: {"orderId": params["orderId"]});
                break;
            }
          },
        ),
      );
    } else if (state.hasReachedEnd) {
      return Text(context.l10n.feed_page_end_of_feed_text);
    } else if (state.status == Status.loading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    } else {
      return Text(context.l10n.feed_page_empty_feed_text);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
