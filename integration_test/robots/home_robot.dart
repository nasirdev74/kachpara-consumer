import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeRobot {
  const HomeRobot(this.tester);
  final WidgetTester tester;
  Future<void> tapOnPlusButton() async {
    final Finder byIcon = find.byType(IconButton).last;
    await tester.tap(byIcon);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnProfileButton() async {
    final Finder byIcon = find.byIcon(Icons.settings);
    await tester.tap(byIcon);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnStore(String storeId) async {
    final Finder store = find.byKey(Key("menu-$storeId"));
    await tester.tap(store);
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }

  Future<void> tapOnViewCart() async {
    final viewCartButton = find.byKey(const Key('viewCart'));
    await tester.tap(viewCartButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnAddStore() async {
    final addStoreButton = find.byKey(const Key('addStoreReferral'));
    await tester.tap(addStoreButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnAddFromGoogle() async {
    final addStoreButton = find.byKey(const Key('addFromMap'));
    await tester.tap(addStoreButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnRewardShare(String storeId) async {
    final Finder store = find.byKey(Key("reward-$storeId"));
    await tester.tap(store);
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }
}
