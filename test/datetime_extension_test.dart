import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('main', () {
    DateTime result = DateTime(2020, 1, 1);

    expect(true, result == result.clone);
    expect(result.copyWith(day: 2), result.nextDay);
    expect(result.copyWith(year: 2019, month: 12, day: 31), result.previousDay);
    // expect(result.copyWith(year: 2020, month: 12, day: 31), result.endOfYear);

    expect(result.addYears(1).year, result.year + 1);
  });
}
