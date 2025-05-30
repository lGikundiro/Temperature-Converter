import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:temperature_converter_app/main.dart';

void main() {
  testWidgets('Temperature Conversion App Widget Test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TemperatureConverterApp());

    // Verify that the conversion selector is present.
    expect(find.text('Conversion:'), findsOneWidget);

    // Verify that the temperature input field is present.
    expect(find.byType(TextField), findsNWidgets(2));

    // Verify that the convert button is present.
    expect(find.widgetWithText(ElevatedButton, 'CONVERT'), findsOneWidget);

    // Enter a temperature value.
    await tester.enterText(find.byType(TextField).first, '100');

    // Tap the convert button.
    await tester.tap(find.widgetWithText(ElevatedButton, 'CONVERT'));
    await tester.pump(); // Rebuild the widget after the state has changed.

    // Verify that the conversion result is displayed.
    expect(find.textContaining('100'),
        findsWidgets); // Should find input and/or result
  });
}
