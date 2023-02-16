import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('isEmpty', () {
    const Object s1 = '';
    const Object s2 = 't';
    final Object l1 = <String>[];
    final Object l2 = <String>['test'];
    final Object m1 = <String, String>{};
    final Object m2 = <String, String>{'test': 'test'};

    expect(s1.isEmpty, true);
    expect(s2.isEmpty, false);
    expect(l1.isEmpty, true);
    expect(l2.isEmpty, false);
    expect(m1.isEmpty, true);
    expect(m2.isEmpty, false);
  });
}
