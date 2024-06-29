import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class PaymentMethodsPageRobot {
  final WidgetTester tester;

  PaymentMethodsPageRobot(this.tester);

  Future<void> tapOnAddPaymentMethod() async {
    final addAddress = find.byKey(const Key("addPaymentMethodPage"));
    await tester.tap(addAddress);
    await tester.pumpAndSettle();
  }

  Future<void> goBack() async {
    await tester.pumpAndSettle(const Duration(milliseconds: 400));
    final addAddress = find.byIcon(Icons.arrow_back);
    await tester.tap(addAddress);
    await tester.pumpAndSettle();
  }
}
