import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class GoogleMapRobot {
  const GoogleMapRobot(this.tester);
  final WidgetTester tester;
  Future<void> clickSaveButton() async {
    final Finder button = find.byKey(const Key('addReferral'));
    await Future.delayed(const Duration(milliseconds: 2500));
    await tester.tap(button);
    await tester.pumpAndSettle();
  }

  Future<void> enterKeyword(String keyword) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final textField = find.byType(TextField).first;
    await tester.enterText(textField, keyword);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> selectFromSearchResults() async {
    // select from results
  }
}
