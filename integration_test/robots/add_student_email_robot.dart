import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

class AddStudentEmailRobot {
  AddStudentEmailRobot(this.tester);

  final WidgetTester tester;

  Future<void> tapOnVerifyStudentEmail() async {
    final Finder byIcon = find.byKey(const Key("verify_student_email")).first;
    await tester.tap(byIcon);
    await tester.pump(const Duration(seconds: 5));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> putEmail(String text) async {
    final textField = find.byKey(const Key("student_email_input")).first;
    await tester.tap(textField);
    await tester.pump(const Duration(milliseconds: 400));
    await tester.enterText(textField, text);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> verifyEmailCode(String emailVerificationCode) async {
    final textField = find.byKey(const Key('emailPinfield'));
    await tester.tap(textField.first);
    await tester.pump();
    await tester.enterText(textField, emailVerificationCode);

    await tester.pump(const Duration(milliseconds: 300));

    final Finder verifyButton = find.byKey(const Key('verifyButton'));
    await tester.tap(verifyButton);
    await tester.pumpAndSettle();
  }
}
