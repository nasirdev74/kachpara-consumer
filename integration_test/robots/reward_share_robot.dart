import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class RewardShareRobot {
  const RewardShareRobot(this.tester);
  final WidgetTester tester;

  Future<void> verifyTotalRewards(String totalRewards) async {
    // Find the widget with the 'reward_share_total_rewards' key
    final totalRewardsFinder = find.byKey(const Key('reward_share_total_rewards'));

    // Verify that the widget displays the expected value of total rewards
    expect(totalRewardsFinder, findsOneWidget);
    expect(
      (tester.widget(totalRewardsFinder) as Text).data,
      totalRewards,
    );
  }

  Future<void> verifyShareableReferralLink(String shareableReferralLink) async {
    // Find the widget with the 'shareable_referral_link' key
    final shareableReferralLinkFinder = find.byKey(const Key('shareable_referral_link'));

    // Verify that the widget displays the expected value of total rewards
    expect(shareableReferralLinkFinder, findsOneWidget);
    expect(
      (tester.widget(shareableReferralLinkFinder) as Text).data,
      shareableReferralLink,
    );
  }

  Future<void> tapOnBackArrow() async {
    final addAddress = find.byIcon(Icons.arrow_back);
    await tester.tap(addAddress);
    await tester.pumpAndSettle();
  }

  Future<void> verifyFPPReward(String fppReward) async {
    // Find the widget with the 'fpp_reward' key
    final fppRewardFinder = find.byKey(const Key('fpp_reward'));

    // Verify that the widget displays the expected value of total rewards
    expect(fppRewardFinder, findsOneWidget);
    expect(
      (tester.widget(fppRewardFinder) as Text).data,
      fppReward,
    );
  }

  Future<void> verifyAddStoreReward(String addStoreReward) async {
    // Find the widget with the 'add_store_reward' key
    final addStoreRewardFinder = find.byKey(const Key('add_store_reward'));

    // Verify that the widget displays the expected value of total rewards
    expect(addStoreRewardFinder, findsOneWidget);
    expect(
      (tester.widget(addStoreRewardFinder) as Text).data,
      addStoreReward,
    );
  }

  Future<void> verifTotalStoreAdditions(String totalStoreAdditons) async {
    // Find the widget with the 'total_store_additions' key
    final totalStoreAdditionsFinder = find.byKey(const Key('total_store_additions'));

    // Verify that the widget displays the expected value of total rewards
    expect(totalStoreAdditionsFinder, findsOneWidget);
    expect(
      (tester.widget(totalStoreAdditionsFinder) as Text).data,
      totalStoreAdditons,
    );
  }

  Future<void> verifyTotalOrders(String totalOrders) async {
    // Find the widget with the 'total_orders' key
    final totalOrdersFinder = find.byKey(const Key('total_orders'));

    // Verify that the widget displays the expected value of total rewards
    expect(totalOrdersFinder, findsOneWidget);
    expect(
      (tester.widget(totalOrdersFinder) as Text).data,
      totalOrders,
    );
  }
}
