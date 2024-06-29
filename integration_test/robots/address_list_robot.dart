import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class AddressListRobot {
  final WidgetTester tester;

  AddressListRobot(this.tester);

  Future<void> tapOnBackArrow() async {
    final addAddress = find.byIcon(Icons.arrow_back);
    await tester.tap(addAddress);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnAddDefaultAddress() async {
    final addAddress = find.byIcon(Icons.add_circle);
    await tester.tap(addAddress);
    await tester.pumpAndSettle();
  }
}
