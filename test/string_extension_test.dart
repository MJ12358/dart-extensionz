import 'package:dart_extensions/dart_extensions.dart';
import 'package:test/test.dart';

void main() {
  test('getters', () {
    expect('C'.initials, 'C');
    expect('C '.initials, 'C');
    expect('Jon'.initials, 'J o');
    expect('Jon '.initials, 'J o');
    expect('Jon Snow'.initials, 'J S');
    expect('Jon  Snow'.initials, 'J S');
    expect('Ramsey Bolton Snow'.initials, 'R B');
    expect('Ramsey  Bolton  Snow'.initials, 'R B');
  });

  test('toDurationISO', () {
    Duration result1 = Duration(
      days: 1212,
      minutes: 30,
    );

    Duration result2 = Duration(
      days: 3,
    );

    Duration result3 = Duration(
      days: 1,
      hours: 1,
      minutes: 30,
    );

    Duration result4 = Duration(
      hours: 1,
      minutes: 30,
    );

    expect('P3Y16W5DT30M'.toDuration(), result1);
    expect('P3D'.toDuration(), result2);
    expect('P1DT1H30M'.toDuration(), result3);
    expect('PT1H30M'.toDuration(), result4);
  });

  test('toDurationDart', () {
    Duration result1 = Duration(
      days: 6,
      hours: 5,
      minutes: 4,
      seconds: 3,
      milliseconds: 2,
      microseconds: 1,
    );

    Duration result2 = Duration(
      hours: 5,
      minutes: 4,
      seconds: 3,
      milliseconds: 2,
      microseconds: 1,
    );

    expect(result1.toString().toDuration(), result1);
    expect(result2.toString().toDuration(), result2);
  });
}
