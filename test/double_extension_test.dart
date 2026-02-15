import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('real', () {
    expect(1.0.real, 1);
    expect(1.5.real, 1);
    expect(-1.5.real, -1);
    expect(123.456.real, 123);
    expect(-123.456.real, -123);
    expect(null.real, null);
  });

  test('fractional', () {
    expect(1.0.fractional, 0.0);
    expect(1.1.fractional, 0.1);
    expect(1.123.fractional, 0.123);
    expect(-1.5.fractional, -0.5);
    expect(123.456.fractional, 0.456);
    expect(null.fractional, null);
  });
}
