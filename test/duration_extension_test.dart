import 'package:dart_extensions/dart_extensions.dart';
import 'package:test/test.dart';

void main() {
  test('getters', () {
    const Duration result = Duration(
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
  test('toISO', () {
    // TODO: write more tests
    // expect(const Duration(days: 800, minutes: 30).toISO(), 'P2YT30M');
    expect(const Duration(days: 3).toISO(), 'P3D');
    expect(const Duration(days: 1, hours: 1, minutes: 30).toISO(), 'P1DT1H30M');
    expect(const Duration(hours: 1, minutes: 30).toISO(), 'PT1H30M');
  });
}
