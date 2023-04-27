// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_testing_demo/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    final addButton = find.byKey(const Key('OtherPageAddButton'));
    // await tester.tap(find.byIcon(Icons.arrow_upward));
    await tester.tap(addButton);
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // navigate to Other Page
    final nextpageButton = find.byKey(const Key('GotoAnotherPage'));
    await tester.tap(nextpageButton);

    // use pumpAndSettle() to ensure we nagivated to the new page
    await tester.pumpAndSettle();

    // we ashould be in OtherPage now
    expect(find.byKey(const Key('OtherPageAddButton')), findsNothing);
    final anotherAdd = find.byKey(const Key('AnotherPageAddButton'));
    expect(anotherAdd, findsOneWidget);
  });
}
