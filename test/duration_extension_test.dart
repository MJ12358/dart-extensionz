import 'package:dart_extensions/dart_extensions.dart';
import 'package:test/test.dart';

void main() {
  test('getters', () {
    Duration result = Duration(
      days: 6,
      hours: 5,
      minutes: 4,
      seconds: 3,
      milliseconds: 2,
      microseconds: 1,
    );

    expect(result.days, 6);
    expect(result.hours, 5);
    expect(result.minutes, 4);
    expect(result.seconds, 3);
    expect(result.milliseconds, 2);
    expect(result.microseconds, 1);
  });

  test('format', () {
    Duration result1 = Duration(
      minutes: 1,
      seconds: 32,
    );

    Duration result2 = Duration(
      seconds: 48,
      milliseconds: 860,
    );

    Duration result3 = Duration(
      seconds: 48,
      milliseconds: 860,
      microseconds: 96,
    );

    expect(result1.format(), '1 m 32 s');
    expect(result2.format(), '48 s 860 ms');
    expect(result3.format(), '48 s 860 ms 96 µs');
  });

  test('toISO', () {
    expect(Duration(days: 1212, minutes: 30).toISO(), 'P3Y16W5DT30M');
    expect(Duration(days: 3).toISO(), 'P3D');
    expect(Duration(days: 1, hours: 1, minutes: 30).toISO(), 'P1DT1H30M');
    expect(Duration(hours: 1, minutes: 30).toISO(), 'PT1H30M');
  });
}
