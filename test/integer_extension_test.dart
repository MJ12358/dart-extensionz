import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('main', () {
    expect(1.ordinal, '1st');
    expect(2.ordinal, '2nd');
    expect(3.ordinal, '3rd');
    expect(4.ordinal, '4th');
    expect(5.ordinal, '5th');
    expect(6.ordinal, '6th');
    expect(7.ordinal, '7th');
    expect(8.ordinal, '8th');
    expect(9.ordinal, '9th');
    expect(10.ordinal, '10th');
    expect(11.ordinal, '11th');
    expect(12.ordinal, '12th');
    expect(21.ordinal, '21st');
    expect(22.ordinal, '22nd');
    expect(23.ordinal, '23rd');
  });
}
