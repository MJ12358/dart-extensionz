import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('length', () {
    expect(0.length, 1);
    expect(1.0.length, 3);
    expect(1.234.length, 5);
  });

  test('toBool', () {
    num? nullTest;
    expect(0.toBool(), false);
    expect(1.toBool(), true);
    expect(123.toBool(), false);
    expect(12.34.toBool(), false);
    expect(nullTest.toBool(), false);
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
    expect(5.000000000001.toPrecision(2), 5.00);
    expect(7.580000000000000001.toPrecision(2), 7.58);
  });

  test('humanize', () {
    expect(double.nan.humanize(), '');
    expect(0.humanize(), '0');
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

  test('computerize', () {
    expect(double.nan.computerize(), '');
    expect(0.computerize(), '0 B');
    expect(1.computerize(), '1 B');
    expect(10.computerize(), '10 B');
    expect(1.024e+3.computerize(), '1 KB');
    expect(1.048576e+6.computerize(), '1 MB');
    expect(1.073741824e+9.computerize(), '1 GB');
    expect(1.099511627776e+12.computerize(), '1 TB');
    expect(1.125899906842624e+15.computerize(), '1 PB');
    expect(1.152921504606846976e+18.computerize(), '1 EB');
    expect(1234.computerize(), '1 KB');
    expect(1753.computerize(), '2 KB');
    expect(1234.computerize(decimals: 2), '1.21 KB');
    expect(1753.computerize(decimals: 2), '1.71 KB');
  });

  test('toCardinal', () {
    expect(0.toCardinal(), Cardinal.north);
    expect(22.5.toCardinal(), Cardinal.northNorthEast);
    expect(45.toCardinal(), Cardinal.northEast);
    expect(67.5.toCardinal(), Cardinal.eastNorthEast);
    expect(90.toCardinal(), Cardinal.east);
    expect(112.5.toCardinal(), Cardinal.eastSouthEast);
    expect(135.toCardinal(), Cardinal.southEast);
    expect(157.5.toCardinal(), Cardinal.southSouthEast);
    expect(180.toCardinal(), Cardinal.south);
    expect(202.5.toCardinal(), Cardinal.southSouthWest);
    expect(225.toCardinal(), Cardinal.southWest);
    expect(247.5.toCardinal(), Cardinal.westSouthWest);
    expect(270.toCardinal(), Cardinal.west);
    expect(292.5.toCardinal(), Cardinal.westNorthWest);
    expect(315.toCardinal(), Cardinal.northWest);
    expect(337.5.toCardinal(), Cardinal.northNorthWest);
    expect(360.toCardinal(), Cardinal.north);
  });

  test('toWeekDay', () {
    final DateTime monday = DateTime(2020, 1, 6);
    final DateTime tuesday = DateTime(2020, 1, 7);
    final DateTime wednesday = DateTime(2020, 1, 8);
    final DateTime thursday = DateTime(2020, 1, 9);
    final DateTime friday = DateTime(2020, 1, 10);
    final DateTime saturday = DateTime(2020, 1, 11);
    final DateTime sunday = DateTime(2020, 1, 12);

    expect(monday.weekday.toWeekDay(), 'Monday');
    expect(tuesday.weekday.toWeekDay(), 'Tuesday');
    expect(wednesday.weekday.toWeekDay(), 'Wednesday');
    expect(thursday.weekday.toWeekDay(), 'Thursday');
    expect(friday.weekday.toWeekDay(), 'Friday');
    expect(saturday.weekday.toWeekDay(), 'Saturday');
    expect(sunday.weekday.toWeekDay(), 'Sunday');
  });
}
