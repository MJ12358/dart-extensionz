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
    expect(TestEnum.values.labels,
        ['One', 'Hello World', 'Xml Http Request', 'Separate Words']);
  });

  test('names', () {
    expect(TestEnum.values.names,
        ['one', 'helloWorld', 'XmlHttpRequest', 'separate_words']);
  });
}
