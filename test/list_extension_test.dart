import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

import 'enum_extension_test.dart';

void main() {
  test('castTo', () {
    const List<Object?>? test1 = null;
    expect(test1.castTo<int>(), <int>[]);
    expect(test1.castTo<String>(), <String>[]);
    expect(test1.castTo<double>(), <double>[]);
    final List<Object?> test2 = <Object?>[1, 'test', 2, 'example', null];
    expect(test2.castTo<int>(), <int>[1, 2]);
    expect(test2.castTo<String>(), <String>['test', 'example']);
    expect(test2.castTo<double>(), <double>[]);
    final List<Object?> test3 = <Object?>[null, null, 1];
    expect(test3.castTo<int>(), <int>[1]);
  });

  test('clone', () {
    final List<int> result = <int>[0, 1, 2, 3];
    final List<int> other = <int>[4, 5, 6, 7];

    expect(result.clone, result);
    expect(result.cloneAdd(other), <int>[0, 1, 2, 3, 4, 5, 6, 7]);
  });

  test('contains', () {
    final List<String> value = <String>['test', 'Test', 'TEST'];
    final List<String> value1 = <String>['derp', 'testing', 'TESTING'];
    final List<int> value2 = <int>[1, 2, 3];

    expect(value.containsIgnoreCase(''), isFalse);
    expect(value.containsIgnoreCase(null), isFalse);
    expect(value.containsIgnoreCase('test'), isTrue);
    expect(value.containsIgnoreCase('tEsT'), isTrue);

    expect(value1.containsIgnoreCase(''), isFalse);
    expect(value1.containsIgnoreCase(null), isFalse);
    expect(value1.containsIgnoreCase('test'), isFalse);
    expect(value1.containsIgnoreCase('tEsT'), isFalse);
    expect(value1.containsIgnoreCase('tEsTinG'), isTrue);

    expect(value2.containsIgnoreCase(''), isFalse);
    expect(value2.containsIgnoreCase(null), isFalse);
    expect(value2.containsIgnoreCase(1), isTrue);
    expect(value2.containsIgnoreCase('1'), isTrue);
  });

  test('lastIndex', () {
    final List<String> value = <String>['test', 'Test', 'TEST'];
    final List<String> value1 = <String>['derp', 'testing', 'TESTING'];
    final List<int> value2 = <int>[1, 2, 3];

    expect(value.lastIndex, 2);
    expect(value1.lastIndex, 2);
    expect(value2.lastIndex, 2);
  });

  test('min', () {
    final List<num> test = <num>[0, 1, 2, 3];
    expect(test.min, 0);
  });

  test('max', () {
    final List<num> test = <num>[0, 1, 2, 3];
    expect(test.max, 3);
  });

  test('sum', () {
    final List<int> test1 = <int>[0, 1, 2, 3];
    final List<int?> test2 = <int?>[0, 1, null, 2, 3];
    expect(test1.sum, 6);
    expect(test2.sum, 6);
  });

  test('average', () {
    final List<int> test1 = <int>[0, 1, 2, 3];
    final List<int?> test2 = <int?>[0, 1, null, 2, 3];
    expect(test1.average, 1.5);
    expect(test2.average, 1.5);
  });

  test('toEnum', () {
    expect(
      TestEnum.values.names.toEnum(TestEnum.values),
      TestEnum.values,
    );
  });

  test('removeNull', () {
    const List<int>? test1 = null;
    expect(test1.removeNull(), <int>[]);

    final List<int?> test2 = <int?>[0, 1, null, 2, 3];
    expect(test2.removeNull(), <int>[0, 1, 2, 3]);

    final List<Object?> test3 = <Object?>[
      0,
      1,
      null,
      2,
      3,
      <int?>[4, null, 5],
      <String, Object?>{'a': 6, 'b': null, 'c': 7},
    ];
    expect(
      test3.removeNull(),
      <Object?>[
        0,
        1,
        2,
        3,
        <int>[4, 5],
        <String, Object>{'a': 6, 'c': 7},
      ],
    );
  });
}
