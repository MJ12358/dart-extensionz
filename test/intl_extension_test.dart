// ignore_for_file: constant_identifier_names

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test/test.dart';

const String en_US = 'en_US';
const String en_GB = 'en_GB';
const String de_DE = 'de_DE';

void main() {
  initializeDateFormatting();
  group('toDateTime', () {
    const String value1 = '01/01/2020';
    const String value2 = '08:30 AM';
    final DateTime value3 = DateTime(2020);
    test(en_US, () {
      final DateTime? result1 = value1.toDateTime(
        pattern: 'MM/dd/yyyy',
        locale: en_US,
      );
      final DateTime? result2 = value2.toDateTime(
        pattern: 'hh:mm a',
        locale: en_US,
      );
      expect(result1, DateTime(2020));
      expect(result2, DateTime(1970, 1, 1, 8, 30));
      expect(value3.toString().toDateTime(), value3);
    });

    test(en_GB, () {
      final DateTime? result1 = value1.toDateTime(
        pattern: 'dd/MM/yyyy',
        locale: en_GB,
      );
      final DateTime? result2 = value2.toDateTime(
        pattern: 'hh:mm a',
        locale: en_GB,
      );
      expect(result1, DateTime(2020));
      expect(result2, DateTime(1970, 1, 1, 8, 30));
      expect(value3.toString().toDateTime(), value3);
    });

    test(de_DE, () {
      final DateTime? result1 = value1.toDateTime(
        pattern: 'dd/MM/yyyy',
        locale: de_DE,
      );
      final DateTime? result2 = value2.toDateTime(
        pattern: 'hh:mm a',
        locale: de_DE,
      );
      expect(result1, DateTime(2020));
      expect(result2, DateTime(1970, 1, 1, 8, 30));
      expect(value3.toString().toDateTime(), value3);
    });

    test('backCompat', () {
      final DateTime result1 = DateTime(1970, 1, 1, 6, 30);
      final DateTime result2 = DateTime(1970, 1, 1, 15, 30);
      expect(''.toDateTime(), null);
      expect('06:30 AM'.toDateTime(), result1);
      expect('6:30 AM'.toDateTime(), result1);
      expect('03:30 PM'.toDateTime(), result2);
      expect('3:30 PM'.toDateTime(), result2);
      expect('15:30'.toDateTime(), result2);
    });
  });

  group('toDuration', () {
    const String value1 = '08:30 AM';
    const String value2 = '05:25:30';
    const Duration value3 = Duration(hours: 1, minutes: 15, seconds: 30);
    test(en_US, () {
      final Duration? result1 = value1.toDuration(
        pattern: 'hh:mm a',
        locale: en_US,
      );
      final Duration? result2 = value2.toDuration(
        pattern: 'hh:mm:ss',
        locale: en_US,
      );
      expect(result1, const Duration(hours: 8, minutes: 30));
      expect(result2, const Duration(hours: 5, minutes: 25, seconds: 30));
      expect(value3.toString().toDuration(), value3);
    });

    test(en_GB, () {
      final Duration? result1 = value1.toDuration(
        pattern: 'hh:mm a',
        locale: en_GB,
      );
      final Duration? result2 = value2.toDuration(
        pattern: 'hh:mm:ss',
        locale: en_GB,
      );
      expect(result1, const Duration(hours: 8, minutes: 30));
      expect(result2, const Duration(hours: 5, minutes: 25, seconds: 30));
      expect(value3.toString().toDuration(), value3);
    });

    test(de_DE, () {
      final Duration? result1 = value1.toDuration(
        pattern: 'hh:mm a',
        locale: de_DE,
      );
      final Duration? result2 = value2.toDuration(
        pattern: 'hh:mm:ss',
        locale: de_DE,
      );
      expect(result1, const Duration(hours: 8, minutes: 30));
      expect(result2, const Duration(hours: 5, minutes: 25, seconds: 30));
      expect(value3.toString().toDuration(), value3);
    });
  });

  test('stringFormat', () {
    const Duration result1 = Duration(
      minutes: 1,
      seconds: 32,
    );

    const Duration result2 = Duration(
      seconds: 48,
      milliseconds: 860,
    );

    const Duration result3 = Duration(
      seconds: 48,
      milliseconds: 860,
      microseconds: 96,
    );

    expect(result1.format(pattern: "m 'm' ss 's'"), '1 m 32 s');
    expect(result2.format(pattern: "ss 's' SSS 'ms'"), '48 s 860 ms');
    expect(result3.format(pattern: "ss 's' SSS 'ms'"), '48 s 860 ms');
  });

  test('toISO', () {
    expect(const Duration(days: 1212, minutes: 30).toISO(), 'P3Y16W5DT30M');
    expect(const Duration(days: 3).toISO(), 'P3D');
    expect(const Duration(days: 1, hours: 1, minutes: 30).toISO(), 'P1DT1H30M');
    expect(const Duration(hours: 1, minutes: 30).toISO(), 'PT1H30M');
  });

  group('toCompactCurrency', () {
    const num value = 1200000;
    test(en_GB, () {
      final String result = value.toCompactCurrency(locale: en_US);
      expect(result, r'$1.2M');
    });

    test(en_GB, () {
      final String result = value.toCompactCurrency(locale: en_GB);
      expect(result, '£1.2M');
    });

    test(de_DE, () {
      final String result = value.toCompactCurrency(locale: de_DE);
      expect(result, '1,2 Mio. €');
    });
  });

  group('toSimpleCurrency', () {
    const num value = 75.5;
    test(en_US, () {
      final String result = value.toSimpleCurrency(locale: en_US);
      expect(result, r'$75.50');
    });

    test(en_GB, () {
      final String result = value.toSimpleCurrency(locale: en_GB);
      expect(result, '£75.50');
    });

    test(de_DE, () {
      final String result = value.toSimpleCurrency(locale: de_DE);
      expect(result, '75,50 €');
    });
  });

  test('toCompact', () {
    const num value = 1200000;
    final String result = value.toCompact();
    expect(result, '1.2M');
  });

  test('toDecimalPattern', () {
    const num value = 12.123;
    final String result = value.toDecimalPattern();
    expect(result, '12.123');
  });

  test('toPercentPattern', () {
    const num value = 0.75;
    final String result = value.toPercentPattern();
    expect(result, '75%');
  });

  test('toScientificPattern', () {
    const num value = 1200000;
    final String result = value.toScientificPattern();
    expect(result, '1E6');
  });
}
