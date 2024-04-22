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

  test('toType', () {
    const bool t1 = true;
    const double t2 = 5.55;
    // this results in "TestEnum"
    // const Enum t3 = TestEnum.one;
    final Future<dynamic> t4 = Future<dynamic>.value('test');
    const int t5 = 5;
    // this returns List<dynamic>
    // final Iterable<dynamic> t6 = <String>['test'];
    final List<dynamic> t7 = <dynamic>['test'];
    // this returns int
    // const num t8 = 5;
    final Runes t9 = Runes('test');
    final Set<dynamic> t10 = <dynamic>{'test'};
    final Stream<dynamic> t11 = Stream<dynamic>.value('test');
    const String t12 = 'test';
    const Symbol t13 = Symbol('test');
    expect(t1.runtimeType.toString().toType(), bool);
    expect(t2.runtimeType.toString().toType(), double);
    // expect(t3.runtimeType.toString().toType(), enum);
    expect(t4.runtimeType.toString().toType(), Future);
    expect(t5.runtimeType.toString().toType(), int);
    // expect(t6.runtimeType.toString().toType(), Iterable);
    expect(t7.runtimeType.toString().toType(), List);
    // expect(t8.runtimeType.toString().toType(), num);
    expect(t9.runtimeType.toString().toType(), Runes);
    expect(t10.runtimeType.toString().toType(), Set);
    expect(t11.runtimeType.toString().toType(), Stream);
    expect(t12.runtimeType.toString().toType(), String);
    expect(t13.runtimeType.toString().toType(), Symbol);
    expect(null.runtimeType.toString().toType(), Null);
    expect(null.toType(), Null);
  });

  test('types', () {
    expect(true.isBool, true);
    expect(4.0.isDouble, true);
    expect(TestEnum.one.isEnum, true);
    expect(Future<int>.value(0).isFuture, true);
    expect(1.isInt, true);
    expect(<String>['test'].isIterable, true);
    expect(<String>['test'].isList, true);
    expect(<String, String>{'key': 'value'}.isMap, true);
    expect(10.isNum, true);
    expect(<String>{'test'}.isSet, true);
    expect(const Stream<void>.empty().isStream, true);
    expect('test'.isString, true);

    expect(null.isBool, false);
    expect(null.isDouble, false);
    expect(null.isEnum, false);
    expect(null.isFuture, false);
    expect(null.isInt, false);
    expect(null.isIterable, false);
    expect(null.isList, false);
    expect(null.isMap, false);
    expect(null.isNum, false);
    expect(null.isRunes, false);
    expect(null.isSet, false);
    expect(null.isStream, false);
    expect(null.isString, false);
    expect(null.isSymbol, false);
  });
}
