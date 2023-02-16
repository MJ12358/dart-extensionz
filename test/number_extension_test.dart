import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('toBool', () {
    expect(0.toBool(), false);
    expect(1.toBool(), true);
    expect(123.toBool(), false);
    expect(12.34.toBool(), false);
  });

  test('stripTrailingZeros', () {
    expect(12.34.stripTrailingZeros(), 12.34);
    expect(12.340.stripTrailingZeros(), 12.34);
    expect(12.34000000000.stripTrailingZeros(), 12.34);
    expect(12.34001.stripTrailingZeros(), 12.34001);
    expect(12.34001000.stripTrailingZeros(), 12.34001);
  });

  test('pad', () {
    expect(3.padLeft(3), '003');
    expect(3.padRight(3), '300');
    expect(12.34.padLeft(8, '!'), '!!!12.34');
    expect(12.34.padRight(8, '!'), '12.34!!!');
  });

  test('inBetween', () {
    expect(12.isBetween(11, 13), true);
    expect(12.isBetween(23, 25), false);
    expect(12.isOutside(11, 13), false);
    expect(12.isOutside(23, 25), true);
  });

  test('toPrecision', () {
    expect(1.toPrecision(3), 1.000);
    expect(4321.12345678.toPrecision(3), 4321.123);
    expect(4321.12345678.toPrecision(5), 4321.12346);
    expect(1234567890.toPrecision(3), 1234567890.000);
    expect(5.25.toPrecision(), 5);
    expect(5.550.toPrecision(1), 5.6);
  });
}
