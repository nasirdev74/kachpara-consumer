import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

class ClaimFreePromotionRobot {
  ClaimFreePromotionRobot(this.tester);

  final WidgetTester tester;

  Future<void> tapOnSubmitMyOrder() async {
    final Finder byIcon = find.byKey(const Key("submitFreePromotionOrder"));
    await tester.tap(byIcon);
    await tester.pumpAndSettle();
  }
}
