// ignore_for_file: constant_identifier_names

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

enum TestEnum {
  one,
  helloWorld,
  XmlHttpRequest,
  separate_words,
  test3,
}

void main() {
  test('label', () {
    expect(TestEnum.one.label, 'One');
    expect(TestEnum.helloWorld.label, 'Hello World');
    expect(TestEnum.XmlHttpRequest.label, 'Xml Http Request');
    expect(TestEnum.separate_words.label, 'Separate Words');
    expect(TestEnum.test3.label, 'Test 3');
  });

  test('labels', () {
    final List<String> result = <String>[
      'One',
      'Hello World',
      'Xml Http Request',
      'Separate Words',
      'Test 3',
    ];

    expect(TestEnum.values.labels, result);
    expect(Set<TestEnum>.from(TestEnum.values).labels, result);
  });

  test('names', () {
    final List<String> result = <String>[
      'one',
      'helloWorld',
      'XmlHttpRequest',
      'separate_words',
      'test3',
    ];

    expect(TestEnum.values.names, result);
    expect(Set<TestEnum>.from(TestEnum.values).names, result);
  });

  test('nullableLabel', () {
    final Enum? result = TestEnum.values.asNameMap()['not present'];

    expect(result.label, '');
  });

  test('nullableLabels', () {
    final List<Enum?> result = TestEnum.values
        .map((TestEnum e) => e.name == 'not present' ? e : null)
        .toList();

    expect(result.labels, <String>[]);
  });

  test('nullableNames', () {
    final List<Enum?> result = TestEnum.values
        .map((TestEnum e) => e.name == 'not present' ? e : null)
        .toList();

    expect(result.names, <String>[]);
  });

  test('alphabetical', () {
    final List<TestEnum> result = <TestEnum>[
      TestEnum.helloWorld,
      TestEnum.one,
      TestEnum.separate_words,
      TestEnum.test3,
      TestEnum.XmlHttpRequest,
    ];
    expect(TestEnum.values.alphabetical, result);
  });

  test('get', () {
    expect(TestEnum.values.get(null), null);
    expect(TestEnum.values.get(''), null);
    expect(TestEnum.values.get('one'), TestEnum.one);
    expect(TestEnum.values.get('One'), TestEnum.one);
    expect(TestEnum.values.get('ONE'), TestEnum.one);
    expect(TestEnum.values.get('oNe'), TestEnum.one);
    expect(TestEnum.values.get('   one   '), TestEnum.one);
    expect(TestEnum.values.get('helloworld'), TestEnum.helloWorld);
    expect(TestEnum.values.get('helloWorld'), TestEnum.helloWorld);
    expect(TestEnum.values.get('helloworld'), TestEnum.helloWorld);
    expect(TestEnum.values.get('hello world'), TestEnum.helloWorld);
    expect(TestEnum.values.get('hello_world'), TestEnum.helloWorld);
    expect(TestEnum.values.get('hello      world'), TestEnum.helloWorld);
    expect(TestEnum.values.get('hello_____world'), TestEnum.helloWorld);
  });
}
