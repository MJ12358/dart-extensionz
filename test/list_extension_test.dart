import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('main', () {
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
}
