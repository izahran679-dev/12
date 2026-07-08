import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_awesome_app/main.dart';

void main() {
  testWidgets('Counter initial state test', (WidgetTester tester) async {
    await tester.pumpWidget(const SirajApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
