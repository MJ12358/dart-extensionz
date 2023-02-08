import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('main', () {
    final DateTime result = DateTime(2020);

    expect(result == result.clone, true);
    expect(result.copyWith(day: 2), result.nextDay);
    expect(result.copyWith(year: 2019, month: 12, day: 31), result.previousDay);
    expect(result.addYears(1).year, result.year + 1);
  });

  test('equivalence', () {
    final DateTime result1 = DateTime(2020);
    final DateTime result2 = DateTime(2020, 1, 1, 12, 30);

    expect(result1.isSameMoment(result2), false);
    expect(result1.isSameYear(result2), true);
    expect(result1.isSameMonth(result2), true);
    expect(result1.isSameWeek(result2), true);
    expect(result1.isSameDay(result2), true);
    expect(result1.isSameHour(result2), false);
    expect(result1.isSameMinute(result2), false);
    expect(result1.isSameSecond(result2), false);
    expect(result1.isWeekend, false);
    expect(DateTime(2023, 1, 29).isWeekend, true);
    expect(result1.isToday, false);
    expect(result1.isYesterday, false);
  });
}
