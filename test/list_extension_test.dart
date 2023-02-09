import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('main', () {
    final List<int> result = <int>[0, 1, 2, 3];
    final List<int> other = <int>[4, 5, 6, 7];

    expect(result.clone, result);
    expect(result.cloneAdd(other), <int>[0, 1, 2, 3, 4, 5, 6, 7]);
  });
}
