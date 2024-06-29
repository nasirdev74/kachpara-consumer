import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

class AllPromotionRobot {
  AllPromotionRobot(this.tester);

  final WidgetTester tester;

  Future<void> waitAndtapOnFreePromotion() async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    final Finder byKey = find.byKey(const Key("freePromotionDetails"));
    await tester.tap(byKey);
    await tester.pumpAndSettle();
  }
}
