import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('length', () {
    expect(0.length, 1);
    expect(1.0.length, 3);
    expect(1.234.length, 5);
  });

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

  test('isBetween', () {
    expect(12.isBetween(11, 13), true);
    expect(12.isBetween(23, 25), false);
  });

  test('isOutside', () {
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

  test('humanize', () {
    expect(1.humanize(), '1');
    expect(10.humanize(), '10');
    expect(1e3.humanize(), '1K');
    expect(1e6.humanize(), '1M');
    expect(1e9.humanize(), '1G');
    expect(1e12.humanize(), '1T');
    expect(1e15.humanize(), '1P');
    expect(1e18.humanize(), '1E');
    expect(1e19.humanize(), '10E');
    expect(1e20.humanize(), '100E'); // 20 digits is the max dart can represent
    // expect(1e21.humanize(), '1Z');
    // expect(1e24.humanize(), '1Y');
    // expect(1e27.humanize(), '1R');
    // expect(1e30.humanize(), '1Q');
    expect(1234.humanize(), '1K');
    expect(1753.humanize(), '2K');
    expect(1234.humanize(decimals: 2), '1.23K');
    expect(1753.humanize(decimals: 2), '1.75K');
  });

  test('toCompassPoint', () {
    expect(0.toCompassPoint(), CompassPoint.north);
    expect(22.5.toCompassPoint(), CompassPoint.northNorthEast);
    expect(45.toCompassPoint(), CompassPoint.northEast);
    expect(67.5.toCompassPoint(), CompassPoint.eastNorthEast);
    expect(90.toCompassPoint(), CompassPoint.east);
    expect(112.5.toCompassPoint(), CompassPoint.eastSouthEast);
    expect(135.toCompassPoint(), CompassPoint.southEast);
    expect(157.5.toCompassPoint(), CompassPoint.southSouthEast);
    expect(180.toCompassPoint(), CompassPoint.south);
    expect(202.5.toCompassPoint(), CompassPoint.southSouthWest);
    expect(225.toCompassPoint(), CompassPoint.southWest);
    expect(247.5.toCompassPoint(), CompassPoint.westSouthWest);
    expect(270.toCompassPoint(), CompassPoint.west);
    expect(292.5.toCompassPoint(), CompassPoint.westNorthWest);
    expect(315.toCompassPoint(), CompassPoint.northWest);
    expect(337.5.toCompassPoint(), CompassPoint.northNorthWest);
    expect(360.toCompassPoint(), CompassPoint.north);
  });
}
