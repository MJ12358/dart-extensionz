import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:test/test.dart';

void main() {
  final DateTime now = DateTime.now();
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

  test('nextDay', () {
    final DateTime test = DateTime(2020);
    final DateTime nextDay = DateTime(2020, 1, 2);
    expect(test.nextDay, nextDay);
  });

  test('previousDay', () {
    final DateTime test = DateTime(2020);
    final DateTime previousDay = DateTime(2019, 12, 31);
    expect(test.previousDay, previousDay);
  });

  test('nextMonth', () {
    final DateTime test = DateTime(2020, 3, 15);
    final DateTime nextMonth = DateTime(2020, 4, 15);
    expect(test.nextMonth, nextMonth);
  });

  test('previousMonth', () {
    final DateTime test = DateTime(2020, 3, 15);
    final DateTime previousMonth = DateTime(2020, 2, 15);
    expect(test.previousMonth, previousMonth);
  });

  test('nextYear', () {
    final DateTime test = DateTime(2020, 3, 15);
    final DateTime nextYear = DateTime(2021, 3, 15);
    expect(test.nextYear, nextYear);
  });

  test('previousYear', () {
    final DateTime test = DateTime(2020, 3, 15);
    final DateTime previousYear = DateTime(2019, 3, 15);
    expect(test.previousYear, previousYear);
  });

  test('week', () {
    final DateTime test = DateTime(2020);
    final DateTime nextWeek = DateTime(2020, 1, 8);
    final DateTime previousWeek = DateTime(2019, 12, 25);
    expect(test.nextWeek, nextWeek);
    expect(test.previousWeek, previousWeek);
    expect(test.week, 1);
    expect(nextWeek.week, 2);
    expect(previousWeek.week, 52);
  });

  test('endOf', () {
    final DateTime test = DateTime(2020);

    final DateTime endOfYear = DateTime(2020, 12, 31, 23, 59, 59, 999, 999);
    final DateTime endOfMonth = DateTime(2020, 1, 31, 23, 59, 59, 999, 999);
    final DateTime endOfWeek = DateTime(2020, 1, 4, 23, 59, 59, 999, 999);
    final DateTime endOfDay = DateTime(2020, 1, 1, 23, 59, 59, 999, 999);
    final DateTime endOfHour = DateTime(2020, 1, 1, 0, 59, 59, 999, 999);
    final DateTime endOfMinute = DateTime(2020, 1, 1, 0, 0, 59, 999, 999);
    final DateTime endOfSecond = DateTime(2020, 1, 1, 0, 0, 0, 999, 999);

    expect(test.endOfYear, endOfYear);
    expect(test.endOfMonth, endOfMonth);
    expect(test.endOfWeek, endOfWeek);
    expect(test.endOfDay, endOfDay);
    expect(test.endOfHour, endOfHour);
    expect(test.endOfMinute, endOfMinute);
    expect(test.endOfSecond, endOfSecond);
  });

  test('startOf', () {
    final DateTime test = DateTime(2020, 6, 15, 12, 30, 30, 500, 500);

    final DateTime startOfYear = DateTime(2020);
    final DateTime startOfMonth = DateTime(2020, 6);
    final DateTime startOfWeek = DateTime(2020, 6, 14);
    final DateTime startOfDay = DateTime(2020, 6, 15);
    final DateTime startOfHour = DateTime(2020, 6, 15, 12);
    final DateTime startOfMinute = DateTime(2020, 6, 15, 12, 30);
    final DateTime startOfSecond = DateTime(2020, 6, 15, 12, 30, 30);

    expect(test.startOfYear, startOfYear);
    expect(test.startOfMonth, startOfMonth);
    expect(test.startOfWeek, startOfWeek);
    expect(test.startOfDay, startOfDay);
    expect(test.startOfHour, startOfHour);
    expect(test.startOfMinute, startOfMinute);
    expect(test.startOfSecond, startOfSecond);
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

  test('dayOfWeek', () {
    final DateTime monday = DateTime(2023, 1, 2);
    final DateTime tuesday = DateTime(2023, 1, 3);
    final DateTime wednesday = DateTime(2023, 1, 4);
    final DateTime thursday = DateTime(2023, 1, 5);
    final DateTime friday = DateTime(2023, 1, 6);
    final DateTime saturday = DateTime(2023, 1, 7);
    final DateTime sunday = DateTime(2023, 1, 8);

    expect(monday.dayOfWeek, DayOfWeek.monday);
    expect(tuesday.dayOfWeek, DayOfWeek.tuesday);
    expect(wednesday.dayOfWeek, DayOfWeek.wednesday);
    expect(thursday.dayOfWeek, DayOfWeek.thursday);
    expect(friday.dayOfWeek, DayOfWeek.friday);
    expect(saturday.dayOfWeek, DayOfWeek.saturday);
    expect(sunday.dayOfWeek, DayOfWeek.sunday);
  });

  test('timeAgo', () {
    final DateTime dt1 = now.add(const Duration(days: -(365 * 3)));
    final DateTime dt2 = now.add(const Duration(days: -366));
    // final DateTime dt3 = now.add(const Duration(days: -(365 ~/ 2)));
    final DateTime dt4 = now.add(const Duration(days: -14));
    final DateTime dt5 = now.add(const Duration(days: -8));
    final DateTime dt6 = now.add(const Duration(hours: -5));
    final DateTime dt7 = now.add(const Duration(hours: -1));
    final DateTime dt8 = now.add(const Duration(minutes: -5));
    final DateTime dt9 = now.add(const Duration(seconds: -5));

    expect(dt1.timeAgo, '3 years ago');
    expect(dt2.timeAgo, '1 year ago');
    // expect(dt3.timeAgo, '6 months ago'); // This one is variable
    expect(dt4.timeAgo, '2 weeks ago');
    expect(dt5.timeAgo, '1 week ago');
    expect(dt6.timeAgo, '5 hours ago');
    expect(dt7.timeAgo, '1 hour ago');
    expect(dt8.timeAgo, '5 minutes ago');
    expect(dt9.timeAgo, 'just now');
  });

  test('add', () {
    final DateTime dt1 = now.add(const Duration(microseconds: 99));
    final DateTime dt2 = now.add(const Duration(milliseconds: 99));
    final DateTime dt3 = now.add(const Duration(seconds: 59));
    final DateTime dt4 = now.add(const Duration(minutes: 59));
    final DateTime dt5 = now.add(const Duration(hours: 23));
    final DateTime dt6 = now.add(const Duration(days: 5));
    final DateTime dt7 = now.add(const Duration(days: 20 * 7));
    final DateTime dt8 = now.add(const Duration(days: 365));

    expect(now.addMicroseconds(99), dt1);
    expect(now.addMilliseconds(99), dt2);
    expect(now.addSeconds(59), dt3);
    expect(now.addMinutes(59), dt4);
    expect(now.addHours(23), dt5);
    expect(now.addDays(5), dt6);
    expect(now.addWeeks(20), dt7);
    expect(now.addYears(1), dt8);
  });

  test('week', () {
    final DateTime dt1 = DateTime(2020);
    final DateTime dt2 = DateTime(2020, 1, 6);
    final DateTime dt15 = DateTime(2020, 4, 6);
    final DateTime dt41 = DateTime(2020, 10, 5);
    final DateTime dt53 = DateTime(2020, 12, 31);
    expect(dt1.week, 1);
    expect(dt2.week, 2);
    expect(dt15.week, 15);
    expect(dt41.week, 41);
    expect(dt53.week, 53);
  });

  test('leapYear', () {
    final DateTime dt0 = DateTime(2020);
    final DateTime dt1 = DateTime(2021);
    final DateTime dt2 = DateTime(2022);
    final DateTime dt3 = DateTime(2023);
    final DateTime dt4 = DateTime(2024);
    expect(dt0.isLeapYear, true);
    expect(dt1.isLeapYear, false);
    expect(dt2.isLeapYear, false);
    expect(dt3.isLeapYear, false);
    expect(dt4.isLeapYear, true);
  });
}
