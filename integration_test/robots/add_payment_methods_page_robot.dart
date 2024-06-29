import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class AddPaymentMethodsPageRobot {
  final WidgetTester tester;

  AddPaymentMethodsPageRobot(this.tester);

  Future<void> enterPaymentMethodDetails(String cardNumber, String cvv, String expireDate) async {
    final nameTextField = find.byKey(const Key("cardNumber"));
    await tester.tap(nameTextField);
    await tester.pumpAndSettle();
    await tester.enterText(nameTextField, cardNumber);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    final addressTextField = find.byKey(const Key("cardCvv"));
    await tester.tap(addressTextField);
    await tester.pumpAndSettle();
    await tester.enterText(addressTextField, cvv);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    final directionTextField = find.byKey(const Key("cardExpireDate"));
    await tester.tap(directionTextField);
    await tester.pumpAndSettle();
    await tester.enterText(directionTextField, expireDate);

    await tester.pumpAndSettle();
  }

  Future<void> tapAddButton() async {
    final addButton = find.byKey(const Key("addPaymentMethodButton"));
    await tester.tap(addButton);
    await tester.pumpAndSettle();
  }
}
