import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('toBool', () {
    expect('y'.toBool(), true);
    expect('yes'.toBool(), true);
    expect('on'.toBool(), true);
    expect('ok'.toBool(), true);
    expect('true'.toBool(), true);
    expect('t'.toBool(), true);
    expect('1'.toBool(), true);

    expect('n'.toBool(), false);
    expect('no'.toBool(), false);
    expect('off'.toBool(), false);
    expect('false'.toBool(), false);
    expect('f'.toBool(), false);
    expect('0'.toBool(), false);
  });

  test('initials', () {
    expect('C'.initials, 'C');
    expect('C '.initials, 'C');
    expect('Jon'.initials, 'J o');
    expect('Jon '.initials, 'J o');
    expect('Jon Snow'.initials, 'J S');
    expect('Jon  Snow'.initials, 'J S');
    expect('Ramsey Bolton Snow'.initials, 'R B');
    expect('Ramsey  Bolton  Snow'.initials, 'R B');
  });

  test('toTitleCase', () {
    expect(''.toTitleCase(), '');
    expect('a'.toTitleCase(), 'A');
    expect('A'.toTitleCase(), 'A');
    expect('a fox'.toTitleCase(), 'A Fox');
    expect('a Fox'.toTitleCase(), 'A Fox');
    expect('a fox jumped'.toTitleCase(), 'A Fox Jumped');
    expect('A fox Jumped'.toTitleCase(), 'A Fox Jumped');
    expect(
      'a fox jumped over the lazy dog'.toTitleCase(),
      'A Fox Jumped Over The Lazy Dog',
    );
  });

  test('normalizeSpace', () {
    expect('       '.normalizeSpace(), '');
    expect('Jon       Snow'.normalizeSpace(), 'Jon Snow');
    expect('   Jon      Snow'.normalizeSpace(), 'Jon Snow');
    expect(' Jon   Snow   '.normalizeSpace(), 'Jon Snow');
  });

  test('isNumeric', () {
    expect('123'.isNumeric, true);
    expect('A1B2C3'.isNumeric, false);
    expect('ABC'.isNumeric, false);
    expect(r'$&@!'.isNumeric, false);
  });

  test('isAlpha', () {
    expect('123'.isAlpha, false);
    expect('A1B2C3'.isAlpha, false);
    expect('ABC'.isAlpha, true);
    expect(r'$&@!'.isAlpha, false);
  });

  test('lineLength', () {
    const String test0 = 'No Lines Here';
    const String test1 = 'T\n';
    const String test2 = 'T\nT\n';
    const String test3 = 'T\nT\nT\n';

    // there is always at least one line
    expect(test0.lineLength, 1);
    expect(test1.lineLength, 2);
    expect(test2.lineLength, 3);
    expect(test3.lineLength, 4);
  });

  test('toDurationISO', () {
    const Duration result1 = Duration(
      days: 1212,
      minutes: 30,
    );

    const Duration result2 = Duration(
      days: 3,
    );

    const Duration result3 = Duration(
      days: 1,
      hours: 1,
      minutes: 30,
    );

    const Duration result4 = Duration(
      hours: 1,
      minutes: 30,
    );

    expect('P3Y16W5DT30M'.toDuration(), result1);
    expect('P3D'.toDuration(), result2);
    expect('P1DT1H30M'.toDuration(), result3);
    expect('PT1H30M'.toDuration(), result4);
  });

  test('toDurationDart', () {
    const Duration result1 = Duration(
      days: 6,
      hours: 5,
      minutes: 4,
      seconds: 3,
      milliseconds: 2,
      microseconds: 1,
    );

    const Duration result2 = Duration(
      hours: 5,
      minutes: 4,
      seconds: 3,
      milliseconds: 2,
      microseconds: 1,
    );

    expect(result1.toString().toDuration(), result1);
    expect(result2.toString().toDuration(), result2);
  });

  test('levenshtein', () {
    expect('kitten'.levenshtein('kitten'), 0);
    expect('kitten'.levenshtein('sitten'), 1);
    expect('kitten'.levenshtein('sitting'), 3);
    expect('saturday'.levenshtein('sunday'), 3);
    expect('rosettacode'.levenshtein('raisethysword'), 8);
  });

  test('repeat', () {
    expect('test'.repeat(-1), 'test');
    expect('test'.repeat(0), 'test');
    expect('test'.repeat(1), 'test');
    expect('test'.repeat(2), 'testtest');
    expect('test'.repeat(2, '-'), 'test-test');
    expect('test'.repeat(4, '-'), 'test-test-test-test');
  });
}
