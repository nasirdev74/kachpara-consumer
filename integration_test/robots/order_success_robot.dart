import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderSuccessRobot {
  const OrderSuccessRobot(this.tester);
  final WidgetTester tester;

  Future<void> tapOnTrackOrder() async {
    final Finder byIcon = find.byKey(const Key("orderDetail"));
    await tester.tap(byIcon);
    await tester.pumpAndSettle();
  }
}
