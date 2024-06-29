import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class CheckoutRobot {
  const CheckoutRobot(this.tester);
  final WidgetTester tester;
  Future<void> findDefaultAddress() async {}
  Future<void> goToAddressList() async {
    final addAddress = find.byKey(const Key("address_list"));
    await tester.tap(addAddress);
    await tester.pumpAndSettle();
  }

  Future<void> goToPaymentMethodsList() async {
    final addAddress = find.byKey(const Key("payment_methods_list"));
    await tester.tap(addAddress);
    await tester.pumpAndSettle();
  }

  Future<void> clickPlaceOrder() async {
    final placeOrderButton = find.byKey(const Key("placeOrder"));
    await tester.ensureVisible(placeOrderButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 400));
    await tester.tap(placeOrderButton);
    await tester.pumpAndSettle();
  }

  Future<void> goToOrderDetail() async {
    final orderDetail = find.byKey(const Key("orderDetail"));
    await tester.tap(orderDetail);
    await tester.pumpAndSettle();
  }
}
