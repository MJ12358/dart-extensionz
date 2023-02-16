import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  test('main', () {
    final DateTime test1 = DateTime(2020);
    final DateTime test2 = DateTime(2020, 1, 1, 5, 30, 30);

    expect(test1.clone, test1);
    expect(test2.date, DateTime(2020));
    expect(test1.copyWith(day: 2), test1.nextDay);
    expect(test1.copyWith(year: 2019, month: 12, day: 31), test1.previousDay);
    expect(test1.addYears(1).year, test1.year + 1);
    expect(test2.daysUntilWeekend, 3);
  });

  test('equivalence', () {
    final DateTime test1 = DateTime(2020);
    final DateTime test2 = DateTime(2020, 1, 1, 12, 30);

    expect(test1.isSameMoment(test2), false);
    expect(test1.isSameYear(test2), true);
    expect(test1.isSameMonth(test2), true);
    expect(test1.isSameWeek(test2), true);
    expect(test1.isSameDay(test2), true);
    expect(test1.isSameHour(test2), false);
    expect(test1.isSameMinute(test2), false);
    expect(test1.isSameSecond(test2), false);
    expect(test1.isWeekend, false);
    expect(test1.isWeekday, true);
    expect(DateTime(2023, 1, 29).isWeekend, true);
    expect(test1.isToday, false);
    expect(test1.isYesterday, false);
    expect(test1.isTomorrow, false);
    expect(test1.isLeapYear, true); // 2020 was a leap year
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
