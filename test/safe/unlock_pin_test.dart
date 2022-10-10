import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:senacor_devcon_mysafe/log/log.dart';
import 'package:senacor_devcon_mysafe/safe/unlock_pattern.dart';
import 'package:senacor_devcon_mysafe/safe/unlock_pin.dart';

void main() {
  testWidgets('should display headline', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: UnlockPin()));

    expect(find.text('Enter the PIN'), findsOneWidget);
  });

  testWidgets('should display pin field', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: UnlockPin()));

    var pinFieldFinder = find.byKey(UnlockPinForm.pinFieldKey);
    expect(pinFieldFinder, findsOneWidget);

    final pinField = tester.widget<TextField>(find.descendant(of: pinFieldFinder, matching: find.byType(TextField)));
    expect(pinField.enabled, isTrue);
    expect(pinField.obscureText, isTrue);
    expect(pinField.controller?.value.text, isEmpty);
  });

  group('Submit PIN', () {
    Future<void> pumpTestApp(WidgetTester tester, Widget widget) {
      return tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<Log>(
            create: (_) => Log(),
            child: widget,
          ),
        ),
      );
    }

    testWidgets('should display error if invalid pin is entered', (WidgetTester tester) async {
      await pumpTestApp(tester, const UnlockPin());

      await tester.enterText(find.byKey(UnlockPinForm.pinFieldKey), '1234');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('PIN invalid. Please retry.'), findsOneWidget);

      var pinField = tester.widget<TextFormField>(find.byKey(UnlockPinForm.pinFieldKey));
      expect(pinField.controller?.value.text, isEmpty);
    });

    testWidgets('should navigate to next page if valid pin is entered', (WidgetTester tester) async {
      await pumpTestApp(tester, const UnlockPin());

      await tester.enterText(find.byKey(UnlockPinForm.pinFieldKey), '2022');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.byType(UnlockPattern), findsOneWidget);
    });
  });
}
