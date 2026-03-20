import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('getters', () {
    const Duration result1 = Duration(
      days: 6,
      hours: 5,
      minutes: 4,
      seconds: 3,
      milliseconds: 2,
      microseconds: 1,
    );
    expect(result1.years, 0);
    expect(result1.weeks, 0);
    expect(result1.days, 6);
    expect(result1.hours, 5);
    expect(result1.minutes, 4);
    expect(result1.seconds, 3);
    expect(result1.milliseconds, 2);
    expect(result1.microseconds, 1);

    const Duration result2 = Duration(
      days: 731,
      hours: 5,
    );
    expect(result2.years, 2);
    expect(result2.weeks, 0);
    expect(result2.days, 1);
    expect(result2.hours, 5);
    expect(result2.minutes, 0);
    expect(result2.seconds, 0);
    expect(result2.milliseconds, 0);
    expect(result2.microseconds, 0);

    const Duration result3 = Duration(
      days: 376,
    );
    expect(result3.years, 1);
    expect(result3.weeks, 1);
    expect(result3.days, 4);
    expect(result3.hours, 0);
    expect(result3.minutes, 0);
    expect(result3.seconds, 0);
    expect(result3.milliseconds, 0);
    expect(result3.microseconds, 0);
  });

  test('nullable', () {
    expect(Duration.zero.nullable(), isNull);
    expect(const Duration(days: 1).nullable(), isNotNull);
    expect(const Duration(hours: 3).nullable(), isNotNull);
    expect(const Duration(minutes: 5).nullable(), isNotNull);
    expect(const Duration(seconds: 10).nullable(), isNotNull);
    expect(const Duration(milliseconds: 500).nullable(), isNotNull);
    expect(const Duration(microseconds: 250).nullable(), isNotNull);
  });

  test('copyWith', () {
    final Duration result1 = const Duration(
      days: 6,
      hours: 5,
      minutes: 4,
      seconds: 3,
      milliseconds: 2,
      microseconds: 1,
    ).copyWith();
    expect(result1.days, 6);
    expect(result1.hours, 5);
    expect(result1.minutes, 4);
    expect(result1.seconds, 3);
    expect(result1.milliseconds, 2);
    expect(result1.microseconds, 1);

    final Duration result2 = const Duration(
      days: 6,
      hours: 5,
      minutes: 4,
      seconds: 3,
      milliseconds: 2,
      microseconds: 1,
    ).copyWith(days: 10, minutes: 0);
    expect(result2.inDays, 10);
    expect(result2.hours, 5);
    expect(result2.minutes, 0);
    expect(result2.seconds, 3);
    expect(result2.milliseconds, 2);
    expect(result2.microseconds, 1);
  });
}
