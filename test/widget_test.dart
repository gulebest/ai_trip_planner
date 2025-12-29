import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ai_trip_planner/app.dart';

void main() {
  testWidgets('App boots without crashing', (WidgetTester tester) async {
    // Build the app inside ProviderScope (Riverpod requirement)
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Let routing & animations settle
    await tester.pumpAndSettle();

    // Basic sanity check: MaterialApp exists
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
