import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

import 'enum_extension_test.dart';

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

  test('toEnum', () {
    expect(
      TestEnum.helloWorld.name.toEnum(TestEnum.values),
      TestEnum.helloWorld,
    );
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

  test('toCamelCase', () {
    expect(''.toCamelCase(), '');
    expect('a'.toCamelCase(), 'a');
    expect('A'.toCamelCase(), 'a');
    expect('a fox'.toCamelCase(), 'aFox');
    expect('A Fox'.toCamelCase(), 'aFox');
    expect('A Fox Jumped'.toCamelCase(), 'aFoxJumped');
  });

  test('fromCamelCase', () {
    expect(''.fromCamelCase(), '');
    expect('a'.fromCamelCase(), 'A');
    expect('A'.fromCamelCase(), 'A');
    expect('aFox'.fromCamelCase(), 'A Fox');
    expect('aFoxJumped'.fromCamelCase(), 'A Fox Jumped');
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
    expect('abc'.isNumeric, false);
    expect(r'$&@!'.isNumeric, false);
  });

  test('isAlpha', () {
    expect('123'.isAlpha, false);
    expect('A1B2C3'.isAlpha, false);
    expect('ABC'.isAlpha, true);
    expect('abc'.isAlpha, true);
    expect(r'$&@!'.isAlpha, false);
  });

  test('isAscii', () {
    expect(''.isAscii, true);
    expect('Test'.isAscii, true);
    expect('ZZZ'.isAscii, true);
    expect(r'`!@#$%^&*()'.isAscii, true);
    expect('©'.isAscii, false);
    expect('Ÿ'.isAscii, false);
  });

  test('isNull', () {
    expect('null'.isNull, true);
    expect('nil'.isNull, true);
    expect('nill'.isNull, true);
    expect('nullptr'.isNull, true);
    expect('test'.isNull, false);
    expect('this is null'.isNull, false);
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

  test('wordToNumber', () {
    // ignore: lines_longer_than_80_chars
    final Map<String, num?> result = <String, num?>{
      '': null,
      'null': null,
      'invalid': null,
      'zero': 0,
      'one': 1,
      'one point one': 1.1,
      'one point oh one': 1.01,
      'two': 2,
      'two dot two': 2.2,
      'three': 3,
      'three decimal three': 3.3,
      'four': 4,
      'four point one four': 4.14,
      'four point fourteen': 4.14,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9,
      'ten': 10,
      'eleven': 11,
      'twelve': 12,
      'thirteen': 13,
      'fourteen': 14,
      'fifteen': 15,
      'sixteen': 16,
      'seventeen': 17,
      'eighteen': 18,
      'nineteen': 19,
      'nineteen point nine': 19.9,
      'nineteen dot nineteen': 19.19,
      'twenty': 20,
      'twenty one': 21,
      'twenty two': 22,
      'twenty three': 23,
      'twenty four': 24,
      'twenty five': 25,
      'twenty six': 26,
      'twenty seven': 27,
      'twenty eight': 28,
      'twenty nine': 29,
      'twenty nine dot nine': 29.9,
      'thirty': 30,
      'thirty three': 33,
      'forty': 40,
      'forty four': 44,
      'fifty': 50,
      'fifty five': 55,
      'sixty': 60,
      'sixty six': 66,
      'seventy': 70,
      'seventy seven': 77,
      'eighty': 80,
      'eighty eight': 88,
      'ninety': 90,
      'ninety nine': 99,
      'one hundred': 100,
      'one hundred point one': 100.1,
      'one hundred five': 105,
      'one hundred and five': 105,
      'one hundred five point nineteen': 105.19,
      'two hundred two': 202,
      'two hundred and two': 202,
      'two hundred and two dot one six': 202.16,
      'two hundred two point sixteen': 202.16,
      'one thousand thirty two': 1032,
      'one thousand and thirty two point eighteen': 1032.18,
      'twelve hundred point eighteen': 1200.18,
      'two thousand thirty two': 2032,
      'two thousand two hundred thirty six': 2236,
      'twenty two hundred thirty six': 2236,
      'thirty six hundred thirty six': 3636,
      'one hundred thousand two hundred thirty two': 100232,
      'two hundred thirty two thousand two hundred thirty two': 232232,
      'one million one hundred thirty two': 1000132,
      'two million two hundred and thirty two': 2000232,
      'one billion one million one thousand one hundred thirty two': 1001001132,
      'three hundred billion two hundred million one hundred thousand thirty two':
          300200100032,
      'six trillion five billion four million three thousand two hundred ten':
          6005004003210,
    };
    for (final MapEntry<String, num?> me in result.entries) {
      expect(me.key.wordToNumber(), me.value);
    }
  });
}
