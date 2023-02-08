import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('toPrecision', () {
    expect(1.toPrecision(3), 1.000);
    expect(4321.12345678.toPrecision(3), 4321.123);
    expect(4321.12345678.toPrecision(5), 4321.12346);
    expect(1234567890.toPrecision(3), 1234567890.000);
    expect(5.25.toPrecision(), 5);
    expect(5.550.toPrecision(1), 5.6);
  });
}
