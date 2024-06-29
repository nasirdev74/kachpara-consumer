import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginRobot {
  const LoginRobot(this.tester);
  final WidgetTester tester;
  Future<void> enterPhoneNumber(String phoneNo) async {
    final Finder phoneNumber = find.byType(IntlPhoneField);
    await tester.enterText(phoneNumber, phoneNo);
    final Finder sendCodeButton = find.byKey(const Key('sendCodeButton'));
    await tester.tap(sendCodeButton);
    await tester.pump(const Duration(seconds: 10));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> verifyPhoneNumber(String pinCode) async {
    final textField = find.byKey(const Key('pinfield'));
    await tester.tap(textField.first);
    await tester.pump();
    await tester.enterText(textField, pinCode);

    await tester.pump(const Duration(milliseconds: 500));

    final Finder verifyButton = find.byKey(const Key('verifyButton'));
    await tester.tap(verifyButton);
    await tester.pumpAndSettle();
  }
}
