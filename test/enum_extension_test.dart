// ignore_for_file: constant_identifier_names

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

enum TestEnum {
  one,
  helloWorld,
  XmlHttpRequest,
  separate_words,
}

void main() {
  test('label', () {
    expect(TestEnum.one.label, 'One');
    expect(TestEnum.helloWorld.label, 'Hello World');
    expect(TestEnum.XmlHttpRequest.label, 'Xml Http Request');
    expect(TestEnum.separate_words.label, 'Separate Words');
  });

  test('labels', () {
    final List<String> result = <String>[
      'One',
      'Hello World',
      'Xml Http Request',
      'Separate Words'
    ];

    expect(TestEnum.values.labels, result);
    expect(Set<TestEnum>.from(TestEnum.values).labels, result);
  });

  test('names', () {
    final List<String> result = <String>[
      'one',
      'helloWorld',
      'XmlHttpRequest',
      'separate_words'
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
}
