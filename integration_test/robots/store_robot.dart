import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kachpara/ui/products_list_page/widget/add_to_cart_button.dart';

class StoreRobot {
  const StoreRobot(this.tester);
  final WidgetTester tester;

  Future<void> clickOnContinue() async {
    final login = find.byKey(const Key('continueButton'));
    await tester.tap(login);
    await tester.pumpAndSettle();
  }

  Future<void> expandFirstCategory(selectedCategory) async {
    final category = find.byKey(Key(selectedCategory));
    await tester.tap(category);
    await tester.pumpAndSettle(const Duration(milliseconds: 600));
  }

  Future<void> addFirstProduct() async {
    final Finder product = find.byType(AddToCartButton).first;
    await tester.tap(product);
    await tester.pumpAndSettle();
  }

  Future<void> verifyClaimedCounter(String counter) async {
    // Find the Text widget containing the desired text.
    final textWidget = find.widgetWithText(Text, counter);

    // Verify that the Text widget exists on the screen.
    expect(textWidget, findsOneWidget);
  }

  Future<void> verifyTotalRewardsAmount(String totalRewards) async {
    // Find the widget with the 'total_rewards' key
    final totalRewardsFinder = find.byKey(const Key('total_rewards'));

    // Verify that the widget displays the expected value of total rewards
    expect(totalRewardsFinder, findsOneWidget);
    expect(
      (tester.widget(totalRewardsFinder) as Text).data,
      totalRewards,
    );
  }

  Future<void> tapOnPromotions() async {
    final link = find.byKey(const Key('store_promotions'));

    await tester.tap(link);
    await tester.pumpAndSettle();
  }
}
