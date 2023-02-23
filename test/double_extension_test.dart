import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('fractional', () {
    expect(1.0.fractional, 0.0);
    expect(1.1.fractional, 0.1);
    expect(1.123.fractional, 0.123);
  });

  test('roundDouble', () {
    expect(12.0.roundDouble(), 12.0);
    expect(12.34.roundDouble(), 12.34);
    expect(12.3499.roundDouble(), 12.35);
    expect(12.3499.roundDouble(mode: RoundingMode.floor), 12.34);
    expect(12.34499999.roundDouble(places: 3), 12.345);
  });
}
