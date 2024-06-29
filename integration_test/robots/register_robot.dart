import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class RegisterRobot {
  const RegisterRobot(this.tester);
  final WidgetTester tester;

  Future<void> enterFullName(String fullName) async {
    final textField = find.byKey(const Key('fullName'));
    await tester.enterText(textField, fullName);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnRegister() async {
    final registerButton = find.byKey(const Key('register'));
    await tester.tap(registerButton);
    await tester.pumpAndSettle();
  }
}
