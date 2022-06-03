// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:player_one/core/utils/helpers.dart';

void main() {
  const String rawDuration = "268564";
  const String convertedDuration = '04:28';

  group('helper method for converting a date string to a proper format', () {
    final result = changeToFormattedDuration(rawDuration);
    test('returns a string', () {
      expect(result.runtimeType, rawDuration.runtimeType);
    });

    test('returns the expected result', () {
      expect(result, convertedDuration);
    });
  });
}
