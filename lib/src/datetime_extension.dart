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

  DateTime get nextMonth => clone.setMonth(month + 1);

  DateTime get previousMonth => clone.setMonth(month - 1);

  DateTime get nextYear => clone.setYear(year + 1);

  DateTime get previousYear => clone.setYear(year - 1);

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
    return setYear(year + value);
  }

  DateTime get endOfYear => clone.setYear(year, DateTime.december).endOfMonth;

  DateTime get endOfMonth => DateTime(year, month + 1).addMicroseconds(-1);

  DateTime get endOfWeek => nextWeek.startOfWeek.addMicroseconds(-1);

  DateTime get endOfDay => setHour(23, 59, 999, 999);

  DateTime get endOfHour => setMinute(59, 59, 999, 999);

  DateTime get endOfMinute => setSecond(59, 999, 999);

  DateTime get endOfSecond => clone.setMillisecond(999, 999);

  DateTime get startOfYear =>
      clone.setMonth(DateTime.january, 1, 0, 0, 0, 0, 0);

  DateTime get startOfMonth => clone.setDay(1, 0, 0, 0, 0, 0);

  DateTime get startOfWeek =>
      weekday == DateTime.sunday ? startOfDay : addDays(weekday).startOfDay;

  DateTime get startOfDay => clone.setHour(0, 0, 0, 0, 0);

  DateTime get startOfHour => clone.setMinute(0, 0, 0, 0);

  DateTime get startOfMinute => clone.setSecond(0, 0, 0);

  DateTime get startOfSecond => clone.setMillisecond(0, 0);

  bool isSameMoment(DateTime other) {
    return isAtSameMomentAs(other);
  }

  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  // TODO: determine which you want to use here....

  bool isSameMonth(DateTime other) {
    return isSameYear(other) && month == other.month;
    // return startOfMonth == other.startOfMonth;
  }

  bool isSameWeek(DateTime other) {
    return startOfWeek == other.startOfWeek;
  }

  bool isSameDay(DateTime other) {
    return isSameMonth(other) && month == other.month;
    return startOfDay == other.startOfDay;
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

  DateTime setYear(
    int year, [
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  ]) {
    return DateTime(
      year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime setMonth(
    int month, [
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  ]) {
    return DateTime(
      year,
      month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime setDay(
    int day, [
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  ]) {
    return DateTime(
      year,
      month,
      day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime setHour(
    int hour, [
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  ]) {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime setMinute(
    int minute, [
    int? second,
    int? millisecond,
    int? microsecond,
  ]) {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime setSecond(
    int second, [
    int? millisecond,
    int? microsecond,
  ]) {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime setMillisecond(
    int millisecond, [
    int? microsecond,
  ]) {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime setMicrosecond(int microsecond) {
    return DateTime(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }
}
