import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  bool? nullTest;
  test('toInt', () {
    expect(true.toInt(), 1);
    expect(false.toInt(), 0);
    expect(nullTest.toInt(), 0);
  });

  test('toYesNo', () {
    expect(true.toYesNo(), 'Yes');
    expect(false.toYesNo(), 'No');
    expect(nullTest.toYesNo(), 'No');
  });

  test('toYN', () {
    expect(true.toYN(), 'Y');
    expect(false.toYN(), 'N');
    expect(nullTest.toYN(), 'N');
  });
}
