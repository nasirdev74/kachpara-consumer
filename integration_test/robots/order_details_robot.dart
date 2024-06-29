import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kachpara/ui/order_detail_page/order_detail_page.dart';

class OrderDetailsRobot {
  const OrderDetailsRobot(this.tester);
  final WidgetTester tester;

  Future<void> verifyOrderDetails(String total, String address) async {
    final addressField = find.byKey(const Key("order_details_address"));
    expect(addressField, findsOneWidget);
    final addressWidget = tester.widget<Rowvalue>(addressField);
    expect(addressWidget.value, address);
    final totalField = find.byKey(const Key("order_details_total"));
    expect(totalField, findsOneWidget);
    final totalWidget = tester.widget<Rowvalue>(totalField);
    expect(totalWidget.value, total);
  }

  Future<void> verifyOrderTotal(String total) async {
    final totalField = find.byKey(const Key("order_details_total"));
    expect(totalField, findsOneWidget);
    final totalWidget = tester.widget<Rowvalue>(totalField);
    expect(totalWidget.value, total);
  }

  Future<void> tapOnBackArrow() async {
    final addAddress = find.byIcon(Icons.arrow_back);
    await tester.tap(addAddress);
    await tester.pumpAndSettle();
  }
}
