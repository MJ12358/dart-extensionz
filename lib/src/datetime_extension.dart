extension DateTimeExtension on DateTime {
  DateTime get tommorrow => DateTime(year, month, day + 1);

  DateTime get yesterday => DateTime(year, month, day - 1);

  DateTime addDays(int value) {
    return add(Duration(days: value));
  }

  DateTime addWeeks(int value) {
    return addDays(value * 7);
  }

  DateTime addYears(int value) {
    return setYear(year + value);
  }

  DateTime get endOfDay => setHour(23, 59, 999, 999);

  DateTime get endOfHour => setMinute(59, 59, 999, 999);

  DateTime get endOfMinute => setSecond(59, 999, 999);

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
