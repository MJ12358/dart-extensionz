import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('main', () {
    expect(12.0.roundDouble(), 12.0);
    expect(12.34.roundDouble(), 12.34);
    expect(12.3499.roundDouble(), 12.35);
    expect(12.3499.roundDouble(mode: RoundingMode.floor), 12.34);
    expect(12.34499999.roundDouble(places: 3), 12.345);
  });
}
