import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ReferralCodeEntryRobot {
  const ReferralCodeEntryRobot(this.tester);
  final WidgetTester tester;
  Future<void> clickAddButton() async {
    final Finder button = find.byKey(const Key('addReferral'));
    await Future.delayed(const Duration(milliseconds: 2500));
    await tester.tap(button);
    await tester.pumpAndSettle();
  }

  Future<void> enterReferralCode(String referralCode) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final textField = find.byType(TextField).first;
    await tester.enterText(textField, referralCode);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    print("REFERALLCODE:$referralCode");
    await tester.pumpAndSettle();
  }
}
