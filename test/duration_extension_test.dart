import 'package:dart_extensionz/dart_extensionz.dart';
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
}
