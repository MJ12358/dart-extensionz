import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('first/last', () {
    const String test1 = '';
    const String test2 = 'First';
    const String test3 = 'This is a test!';

    expect(test1.first, '');
    expect(test2.first, 'F');
    expect(test3.first, 'T');

    expect(test1.last, '');
    expect(test2.last, 't');
    expect(test3.last, '!');
  });
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
    expect('4x4'.initials, '4 x');
    expect('N/A'.initials, 'N A');
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

  test('truncate', () {
    expect('test'.truncate(4), 'test');
    expect('testtest'.truncate(4), 't...');
    expect('testtest'.truncate(7), 'test...');
  });

  test('readTime', () {
    expect('Test'.readTime(), 0);
    expect('Hello my name is Slim Shady.'.readTime(), 3);
  });

  test('wordCount', () {
    expect(''.wordCount(), 0);
    expect('Test'.wordCount(), 1);
    expect('Test Me'.wordCount(), 2);
    expect('This is a test'.wordCount(), 4);
    expect('This !5 a test'.wordCount(), 3);
    expect('This !5    a    test'.wordCount(), 3);
  });

  test('wordOccurrences', () {
    final Map<String, int> result = <String, int>{
      'test': 2,
      'this': 1,
      'is': 1,
      'a': 1,
    };
    expect(''.wordOccurrences(), <String, int>{});
    expect('test this is a test'.wordOccurrences(), result);
    expect('test: this is a test!'.wordOccurrences(), result);
    expect('test: this is    a    test!'.wordOccurrences(), result);
  });

  test('mask', () {
    const String value = 'Testing';
    expect(''.mask(), '');
    expect('Test'.mask(), '####');
    expect(value.mask(), '####ing');
    expect(value.mask(end: value.length, char: '*'), '*******');
  });
}
