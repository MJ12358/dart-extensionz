extension DateTimeExtension on DateTime {
  DateTime get clone =>
      DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch, isUtc: isUtc);

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
    return isSameMonth(other) && month == other.month;
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

  DateTime operator +(Duration duration) => add(duration);

  DateTime operator -(Duration duration) => subtract(duration);

  bool operator <(DateTime other) => isBefore(other);

  bool operator <=(DateTime other) => isBefore(other) || isSameMoment(other);

  bool operator >(DateTime other) => isAfter(other);

  bool operator >=(DateTime other) => isAfter(other) || isSameMoment(other);

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
