part of '../dart_extensionz.dart';

enum Season {
  spring,
  summer,
  autumn,
  winter,
}

extension DateTimeExtension on DateTime {
  DateTime get clone =>
      DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch, isUtc: isUtc);

  /// Returns only year, month and day
  DateTime get date => DateTime(year, month, day);

  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ 1000;

  DateTime get tommorrow => DateTime.now().nextDay;

  DateTime get yesterday => DateTime.now().previousDay;

  DateTime get nextDay => addDays(1);

  DateTime get previousDay => addDays(-1);

  DateTime get nextWeek => addWeeks(1);

  DateTime get previousWeek => addWeeks(-1);

  DateTime get nextMonth => clone.copyWith(month: month + 1);

  DateTime get previousMonth => clone.copyWith(month: month - 1);

  DateTime get nextYear => clone.copyWith(year: year + 1);

  DateTime get previousYear => clone.copyWith(year: year - 1);

  DateTime addMicroseconds(int value) {
    return add(Duration(microseconds: value));
  }

  DateTime addMilliseconds(int value) {
    return add(Duration(milliseconds: value));
  }

  DateTime addSeconds(int value) {
    return add(Duration(seconds: value));
  }

  DateTime addMinutes(int value) {
    return add(Duration(minutes: value));
  }

  DateTime addHours(int value) {
    return add(Duration(hours: value));
  }

  DateTime addDays(int value) {
    return add(Duration(days: value));
  }

  DateTime addWeeks(int value) {
    return addDays(value * 7);
  }

  DateTime addYears(int value) {
    return copyWith(year: year + value);
  }

  DateTime get endOfYear =>
      clone.copyWith(year: year, month: DateTime.december).endOfMonth;

  DateTime get endOfMonth => DateTime(year, month + 1).addMicroseconds(-1);

  DateTime get endOfWeek => nextWeek.startOfWeek.addMicroseconds(-1);

  DateTime get endOfDay => copyWith(
        hour: 23,
        minute: 59,
        millisecond: 999,
        microsecond: 999,
      );

  DateTime get endOfHour => copyWith(
        hour: 59,
        minute: 59,
        millisecond: 999,
        microsecond: 999,
      );

  DateTime get endOfMinute => copyWith(
        minute: 59,
        millisecond: 999,
        microsecond: 999,
      );

  DateTime get endOfSecond => clone.copyWith(
        millisecond: 999,
        microsecond: 999,
      );

  DateTime get startOfYear => clone.copyWith(
        month: DateTime.january,
        day: 1,
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  DateTime get startOfMonth => clone.copyWith(
        day: 1,
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  DateTime get startOfWeek =>
      weekday == DateTime.sunday ? startOfDay : addDays(weekday).startOfDay;

  DateTime get startOfDay => clone.copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  DateTime get startOfHour => clone.copyWith(
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  DateTime get startOfMinute => clone.copyWith(
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  DateTime get startOfSecond => clone.copyWith(
        millisecond: 0,
        microsecond: 0,
      );

  bool isSameMoment(DateTime other) {
    return isAtSameMomentAs(other);
  }

  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  bool isSameMonth(DateTime other) {
    return isSameYear(other) && month == other.month;
  }

  bool isSameWeek(DateTime other) {
    return startOfWeek == other.startOfWeek;
  }

  bool isSameDay(DateTime other) {
    return isSameMonth(other) && day == other.day;
  }

  bool isSameHour(DateTime other) {
    return startOfHour == other.startOfHour;
  }

  bool isSameMinute(DateTime other) {
    return startOfMinute == other.startOfMinute;
  }

  bool isSameSecond(DateTime other) {
    return secondsSinceEpoch == other.secondsSinceEpoch;
  }

  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  bool get isWeekday => !isWeekend;

  bool get isToday {
    final DateTime nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day;
  }

  bool get isYesterday {
    final DateTime nowDate = DateTime.now();
    return year == nowDate.year &&
        month == nowDate.month &&
        day == nowDate.day - 1;
  }

  bool get isTommorrow {
    final DateTime nowDate = DateTime.now();
    return year == nowDate.year &&
        month == nowDate.month &&
        day == nowDate.day + 1;
  }

  bool get isLeapYear {
    if (year % 4 != 0) {
      return false;
    }
    if (year % 100 != 0) {
      return true;
    }
    if (year % 400 != 0) {
      return false;
    }
    return true;
  }

  int get daysUntilWeekend {
    if (isWeekend) {
      return 0;
    }
    return DateTime.saturday - weekday;
  }

  /// Return `Season` of this date.
  /// Seasons are defined as:
  /// - Spring: March 20 - June 20
  /// - Summer: June 21 - September 22
  /// - Autumn: September 23 - December 20
  /// - Winter: December 21 - March 19
  Season get season {
    Season result;

    switch (month) {
      case DateTime.january:
      case DateTime.february:
      case DateTime.march:
        result = Season.winter;
        break;
      case DateTime.april:
      case DateTime.may:
      case DateTime.june:
        result = Season.spring;
        break;
      case DateTime.july:
      case DateTime.august:
      case DateTime.september:
        result = Season.summer;
        break;
      default:
        result = Season.autumn;
    }

    if (month == DateTime.march && day >= 20) {
      result = Season.spring;
    } else if (month == DateTime.june && day >= 21) {
      result = Season.summer;
    } else if (month == DateTime.september && day >= 23) {
      result = Season.autumn;
    } else if (month == DateTime.december && day >= 21) {
      result = Season.winter;
    }

    return result;
  }

  bool isInSeason(Season season) => this.season == season;

  DateTime operator +(Duration duration) => add(duration);

  DateTime operator -(Duration duration) => subtract(duration);

  bool operator <(DateTime other) => isBefore(other);

  bool operator <=(DateTime other) => isBefore(other) || isSameMoment(other);

  bool operator >(DateTime other) => isAfter(other);

  bool operator >=(DateTime other) => isAfter(other) || isSameMoment(other);

  /// Returns the earliest date
  DateTime min(DateTime other) {
    return (millisecondsSinceEpoch < other.millisecondsSinceEpoch)
        ? this
        : other;
  }

  /// Returns the later date
  DateTime max(DateTime other) {
    return (millisecondsSinceEpoch > other.millisecondsSinceEpoch)
        ? this
        : other;
  }

  /// Creates a copy of this `DateTime` but with the given fields
  /// replaced with the new values.
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
