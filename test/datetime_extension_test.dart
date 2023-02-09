import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('main', () {
    final DateTime result = DateTime(2020);
    final DateTime result2 = DateTime(2020, 1, 1, 5, 30, 30);

    expect(result.clone, result);
    expect(result2.date, DateTime(2020));
    // expect(result.tomorrow, DateTime(2020, 1, 2));
    // expect(result.yesterday, DateTime(2020, 12, 31));
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

  test('season', () {
    final DateTime springStart = DateTime(2020, 3, 20);
    final DateTime spring = DateTime(2020, 4);
    final DateTime springEnd = DateTime(2020, 6, 20);
    final DateTime summerStart = DateTime(2020, 6, 21);
    final DateTime summer = DateTime(2020, 8);
    final DateTime summerEnd = DateTime(2020, 9, 22);
    final DateTime autumnStart = DateTime(2020, 9, 23);
    final DateTime autumn = DateTime(2020, 11);
    final DateTime autumnEnd = DateTime(2020, 12, 20);
    final DateTime winterStart = DateTime(2020, 12, 21);
    final DateTime winter = DateTime(2020, 2);
    final DateTime winterEnd = DateTime(2020, 3, 19);

    expect(springStart.season, Season.spring);
    expect(spring.season, Season.spring);
    expect(springEnd.season, Season.spring);
    expect(summerStart.season, Season.summer);
    expect(summer.season, Season.summer);
    expect(summerEnd.season, Season.summer);
    expect(autumnStart.season, Season.autumn);
    expect(autumn.season, Season.autumn);
    expect(autumnEnd.season, Season.autumn);
    expect(winterStart.season, Season.winter);
    expect(winter.season, Season.winter);
    expect(winterEnd.season, Season.winter);
  });
}
