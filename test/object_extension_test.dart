import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

import 'enum_extension_test.dart';

void main() {
  Object? o0;
  const Object? o1 = null;
  const Object s1 = '';
  const Object s2 = '     ';
  const Object s3 = 't';
  final Object l1 = <String>[];
  final Object l2 = <String>[''];
  final Object l3 = <String>['test'];
  final Object m1 = <String, String>{};
  final Object m2 = <String, String>{'test': '', 'hello': ''};
  final Object m3 = <String, String>{'test': 'test', 'hello': 'world'};
  test('isEmpty', () {
    expect(o0.isEmpty, true);
    expect(o1.isEmpty, true);
    expect(s1.isEmpty, true);
    expect(s2.isEmpty, false);
    expect(s3.isEmpty, false);
    expect(l1.isEmpty, true);
    expect(l2.isEmpty, false);
    expect(l3.isEmpty, false);
    expect(m1.isEmpty, true);
    expect(m2.isEmpty, false);
    expect(m3.isEmpty, false);
  });

  test('isBlank', () {
    expect(o0.isBlank, true);
    expect(o0.isBlank, true);
    expect(s1.isBlank, true);
    expect(s2.isBlank, true);
    expect(s3.isBlank, false);
    expect(l1.isBlank, true);
    expect(l2.isBlank, true);
    expect(l3.isBlank, false);
    expect(m1.isBlank, true);
    expect(m2.isBlank, true);
    expect(m3.isBlank, false);
  });

  test('types', () {
    expect(true.isBool, true);
    expect(4.0.isDouble, true);
    expect(TestEnum.one.isEnum, true);
    expect(1.isInt, true);
    expect(<String>['test'].isList, true);
    expect(<String, String>{'key': 'value'}.isMap, true);
    expect(10.isNum, true);
    expect(<String>{'test'}.isSet, true);
    expect('test'.isString, true);

    expect(null.isBool, false);
    expect(null.isDouble, false);
    expect(null.isEnum, false);
    expect(null.isInt, false);
    expect(null.isList, false);
    expect(null.isMap, false);
    expect(null.isNum, false);
    expect(null.isSet, false);
    expect(null.isString, false);
  });
}
