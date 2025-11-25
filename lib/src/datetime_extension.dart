part of dart_extensionz;

/// Days of the week.
enum DayOfWeek {
  monday(DateTime.monday),
  tuesday(DateTime.tuesday),
  wednesday(DateTime.wednesday),
  thursday(DateTime.thursday),
  friday(DateTime.friday),
  saturday(DateTime.saturday),
  sunday(DateTime.sunday);

  const DayOfWeek(this.value);

  final int value;
}

/// Months of the year.
enum Month {
  january(DateTime.january, 31),
  february(DateTime.february, 28),
  march(DateTime.march, 31),
  april(DateTime.april, 30),
  may(DateTime.may, 31),
  june(DateTime.june, 30),
  july(DateTime.july, 31),
  august(DateTime.august, 31),
  september(DateTime.september, 30),
  october(DateTime.october, 31),
  november(DateTime.november, 30),
  december(DateTime.december, 31);

  const Month(this.value, this.days);

  final int value;
  final int days;
}

/// A period of the year that is distinguished by special climate conditions.
enum Season {
  spring,
  summer,
  autumn,
  winter,
}

/// [DateTime] Extension.
extension DateTimeExtension on DateTime {
  /// Clone this [DateTime].
  DateTime get clone =>
      DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch, isUtc: isUtc);

  /// Returns only year, month and day.
  DateTime get date => DateTime(year, month, day);

  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ 1000;

  /// Equivalent to `DateTime.now().add(Duration(days: 1))`.
  static DateTime get tomorrow => DateTime.now().nextDay;

  /// Equivalent to `DateTime.now().add(Duration(days: -1))`.
  static DateTime get yesterday => DateTime.now().previousDay;

  /// Equivalent to `this.add(Duration(days: 1))`.
  DateTime get nextDay => addDays(1);

  /// Equivalent to `this.add(Duration(days: -1))`.
  DateTime get previousDay => addDays(-1);

  /// Equivalent to `this.add(Duration(days: 7))`.
  DateTime get nextWeek => addWeeks(1);

  /// Equivalent to `this.add(Duration(days: -7))`.
  DateTime get previousWeek => addWeeks(-1);

  DateTime get nextMonth => copyWith(month: month + 1);

  DateTime get previousMonth => copyWith(month: month - 1);

  DateTime get nextYear => copyWith(year: year + 1);

  DateTime get previousYear => copyWith(year: year - 1);

  /// Calculates week number from a date.
  ///
  /// https://stackoverflow.com/questions/49393231/how-to-get-day-of-year-week-of-year-from-a-datetime-dart-object
  int get week {
    final int day = int.parse(DateFormat('D').format(this));
    return (day - weekday + 10) ~/ 7;
  }

  /// Adds microseconds to this [DateTime].
  DateTime addMicroseconds(int value) {
    return add(Duration(microseconds: value));
  }

  /// Adds milliseconds to this [DateTime].
  DateTime addMilliseconds(int value) {
    return add(Duration(milliseconds: value));
  }

  /// Adds seconds to this [DateTime].
  DateTime addSeconds(int value) {
    return add(Duration(seconds: value));
  }

  /// Adds minutes to this [DateTime].
  DateTime addMinutes(int value) {
    return add(Duration(minutes: value));
  }

  /// Adds hours to this [DateTime].
  DateTime addHours(int value) {
    return add(Duration(hours: value));
  }

  /// Adds days to this [DateTime].
  DateTime addDays(int value) {
    return add(Duration(days: value));
  }

  /// Adds weeks to this [DateTime].
  DateTime addWeeks(int value) {
    return addDays(value * 7);
  }

  /// Adds years to this [DateTime].
  DateTime addYears(int value) {
    return copyWith(year: year + value);
  }

  /// Returns the end of year for this [DateTime].
  DateTime get endOfYear =>
      copyWith(year: year, month: DateTime.december).endOfMonth;

  /// Returns the end of month for this [DateTime].
  DateTime get endOfMonth => DateTime(year, month + 1).addMicroseconds(-1);

  /// Returns the end of week for this [DateTime].
  DateTime get endOfWeek => nextWeek.startOfWeek.addMicroseconds(-1);

  /// Returns the end of day for this [DateTime].
  DateTime get endOfDay => copyWith(
        hour: 23,
        minute: 59,
        second: 59,
        millisecond: 999,
        microsecond: 999,
      );

  /// Returns the end of hour for this [DateTime].
  DateTime get endOfHour => copyWith(
        minute: 59,
        second: 59,
        millisecond: 999,
        microsecond: 999,
      );

  /// Returns the end of minute for this [DateTime].
  DateTime get endOfMinute => copyWith(
        second: 59,
        millisecond: 999,
        microsecond: 999,
      );

  /// Returns the end of second for this [DateTime].
  DateTime get endOfSecond => copyWith(
        millisecond: 999,
        microsecond: 999,
      );

  /// Returns the start of year for this [DateTime].
  DateTime get startOfYear => copyWith(
        month: DateTime.january,
        day: 1,
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  /// Returns the start of month for this [DateTime].
  DateTime get startOfMonth => copyWith(
        day: 1,
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  /// Returns the start of week for this [DateTime].
  DateTime get startOfWeek =>
      weekday == DateTime.sunday ? startOfDay : addDays(-weekday).startOfDay;

  /// Returns the start of day for this [DateTime].
  DateTime get startOfDay => copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  /// Returns the start of hour for this [DateTime].
  DateTime get startOfHour => copyWith(
        minute: 0,
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  /// Returns the start of minute for this [DateTime].
  DateTime get startOfMinute => copyWith(
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

  /// Returns the start of second for this [DateTime].
  DateTime get startOfSecond => copyWith(
        millisecond: 0,
        microsecond: 0,
      );

  /// Equivalent to a nullable [isAtSameMomentAs].
  bool isSameMoment(DateTime? other) {
    if (other == null) {
      return false;
    }
    return isAtSameMomentAs(other);
  }

  bool isSameYear(DateTime? other) {
    if (other == null) {
      return false;
    }
    return year == other.year;
  }

  bool isSameMonth(DateTime? other) {
    if (other == null) {
      return false;
    }
    return isSameYear(other) && month == other.month;
  }

  bool isSameWeek(DateTime? other) {
    if (other == null) {
      return false;
    }
    return startOfWeek == other.startOfWeek;
  }

  bool isSameDay(DateTime? other) {
    if (other == null) {
      return false;
    }
    return isSameMonth(other) && day == other.day;
  }

  bool isSameHour(DateTime? other) {
    if (other == null) {
      return false;
    }
    return startOfHour == other.startOfHour;
  }

  bool isSameMinute(DateTime? other) {
    if (other == null) {
      return false;
    }
    return startOfMinute == other.startOfMinute;
  }

  bool isSameSecond(DateTime? other) {
    if (other == null) {
      return false;
    }
    return secondsSinceEpoch == other.secondsSinceEpoch;
  }

  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  bool get isWeekday => !isWeekend;

  bool get isToday {
    final DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day - 1;
  }

  bool get isTomorrow {
    final DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day + 1;
  }

  /// Returns true if [year] is a leap year.
  bool get isLeapYear => year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

  /// Returns the number of days in the specified month.
  int get daysInMonth {
    if (month == DateTime.february && isLeapYear) {
      return 29;
    }
    return Month.values.firstWhere((Month m) => m.value == month).days;
  }

  /// Returns the number of days until the weekend.
  int get daysUntilWeekend => isWeekend ? 0 : DateTime.saturday - weekday;

  /// Returns a [DateTime] that skips the weekend.
  DateTime get skipWeekend {
    switch (weekday) {
      case DateTime.saturday:
        return addDays(2);
      case DateTime.sunday:
        return addDays(1);
      default:
        return this;
    }
  }

  /// Returns the day of the week as a [DayOfWeek] enum.
  DayOfWeek get dayOfWeek {
    return DayOfWeek.values.firstWhere((DayOfWeek d) => d.value == weekday);
  }

  /// Returns the earliest date.
  DateTime min(DateTime other) {
    return (millisecondsSinceEpoch < other.millisecondsSinceEpoch)
        ? this
        : other;
  }

  /// Returns the later date.
  DateTime max(DateTime other) {
    return (millisecondsSinceEpoch > other.millisecondsSinceEpoch)
        ? this
        : other;
  }

  /// Subtracts the milliseconds and microseconds from this [DateTime].
  DateTime get minusMilliMicro {
    return subtract(
      Duration(
        milliseconds: millisecond,
        microseconds: microsecond,
      ),
    );
  }

  DateTime operator +(Duration duration) => add(duration);

  DateTime operator -(Duration duration) => subtract(duration);

  bool operator <(DateTime other) => isBefore(other);

  bool operator <=(DateTime other) =>
      isBefore(other) || isAtSameMomentAs(other);

  bool operator >(DateTime other) => isAfter(other);

  bool operator >=(DateTime other) => isAfter(other) || isAtSameMomentAs(other);
}

extension DateTimeAgoExtension on DateTime {
  /// Provides a fuzzy time like '3 years ago'.
  String get timeAgo {
    final Duration diff = DateTime.now().difference(this);
    const num daysPerYear = DurationExtension.daysPerYear;
    final num daysPerMonth = daysInMonth;
    const num daysPerWeek = DurationExtension.daysPerWeek;

    if (diff.inDays > daysPerYear) {
      final int years = (diff.inDays / daysPerYear).floor();
      final String s = years == 1 ? 'year' : 'years';
      return '$years $s ago';
    }

    if (diff.inDays > daysPerMonth) {
      final int months = (diff.inDays / daysPerMonth).floor();
      final String s = months == 1 ? 'month' : 'months';
      return '$months $s ago';
    }

    if (diff.inDays > daysPerWeek) {
      final int weeks = (diff.inDays / daysPerWeek).floor();
      final String s = weeks == 1 ? 'week' : 'weeks';
      return '$weeks $s ago';
    }

    if (diff.inDays > 0) {
      final int days = diff.inDays;
      final String s = days == 1 ? 'day' : 'days';
      return '$days $s ago';
    }

    if (diff.inHours > 0) {
      final int hours = diff.inHours;
      final String s = hours == 1 ? 'hour' : 'hours';
      return '$hours $s ago';
    }

    if (diff.inMinutes > 0) {
      final int minutes = diff.inMinutes;
      final String s = minutes == 1 ? 'minute' : 'minutes';
      return '$minutes $s ago';
    }

    return 'just now';
  }
}

extension DateTimeSeasonExtension on DateTime {
  /// Return the [Season] of this date.
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
      case DateTime.april:
      case DateTime.may:
      case DateTime.june:
        result = Season.spring;
      case DateTime.july:
      case DateTime.august:
      case DateTime.september:
        result = Season.summer;
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

  /// Determines if [season] is equal to [this.season].
  bool isInSeason(Season season) => this.season == season;
}
