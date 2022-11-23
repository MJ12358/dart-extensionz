import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toISO', () {
    // TODO: write more tests
    // expect(const Duration(days: 800, minutes: 30).toISO(), 'P2YT30M');
    expect(const Duration(days: 3).toISO(), 'P3D');
    expect(const Duration(days: 1, hours: 1, minutes: 30).toISO(), 'P1DT1H30M');
    expect(const Duration(hours: 1, minutes: 30).toISO(), 'PT1H30M');
  });
}
