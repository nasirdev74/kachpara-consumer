import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class AddressRobot {
  final WidgetTester tester;

  AddressRobot(this.tester);

  Future<void> tapAddButton() async {
    final saveAddress = find.byKey(const Key("saveAddress"));
    await tester.tap(saveAddress);
    await tester.pumpAndSettle();
  }

  Future<void> tapMakeDefaultAddress() async {
    final saveAddress = find.byKey(const Key("setDefaultAddress"));
    await tester.tap(saveAddress);
    await tester.pumpAndSettle(const Duration(seconds: 4));
  }

  Future<void> enterAddressDetails(String name, String address, String direction) async {
    final nameTextField = find.byKey(const Key("addressName"));
    await tester.tap(nameTextField);
    await tester.pumpAndSettle();
    await tester.enterText(nameTextField, name);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    final addressTextField = find.byKey(const Key("addressField"));
    await tester.tap(addressTextField);
    await tester.pumpAndSettle();
    await tester.enterText(addressTextField, address);

    await tester.pumpAndSettle(const Duration(seconds: 1));

    final directionTextField = find.byKey(const Key("directionField"));
    await tester.tap(directionTextField);
    await tester.pumpAndSettle();
    await tester.enterText(directionTextField, direction);

    await tester.pumpAndSettle(const Duration(seconds: 1));
  }
}
