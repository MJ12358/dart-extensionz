import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('toInt', () {
    expect(true.toInt(), 1);
    expect(false.toInt(), 0);
  });

  test('toYesNo', () {
    expect(true.toYesNo(), 'Yes');
    expect(false.toYesNo(), 'No');
  });

  test('toYN', () {
    expect(true.toYN(), 'Y');
    expect(false.toYN(), 'N');
  });
}
