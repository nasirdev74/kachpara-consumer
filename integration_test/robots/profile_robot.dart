import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

class ProfileRobot {
  ProfileRobot(this.tester);

  final WidgetTester tester;

  Future<void> tapOnEditInputStudentEmail() async {
    final Finder byIcon = find.byKey(const Key("student_email_edit_icon"));
    await tester.tap(byIcon);
    await tester.pumpAndSettle();
  }

  Future<void> tapOnEditInputName() async {
    final Finder byIcon = find.byKey(const Key("editIcon")).first;
    await tester.tap(byIcon);
    await tester.pumpAndSettle();
  }

  Future<void> editInputName(String text) async {
    final textField = find.byKey(const Key("inputName")).first;
    await tester.tap(textField);
    await tester.pump(const Duration(milliseconds: 400));
    await tester.enterText(textField, text);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> tapOnBackButton() async {
    final Finder byIcon = find.byIcon(Icons.arrow_back);
    await tester.tap(byIcon);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  Future<void> verifyInputData(String name) async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text(name), findsOneWidget);
  }

  Future<void> verifyStudentEmail(String email) async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text(email), findsOneWidget);
  }
}
