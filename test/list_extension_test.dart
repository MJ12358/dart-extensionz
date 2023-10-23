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
    final List<String> result = <String>['test', 'Test', 'TEST'];
    final List<int> result2 = <int>[1, 2, 3];

    expect(result.containsIgnoreCase('test'), isTrue);
    expect(result.containsIgnoreCase('tEsT'), isTrue);
    expect(result2.containsIgnoreCase(1), isTrue);
    expect(result2.containsIgnoreCase('1'), isTrue);
  });
}
