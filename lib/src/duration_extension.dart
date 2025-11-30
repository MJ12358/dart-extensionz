part of dart_extensionz;

/// [Duration] Extension.
extension DurationExtension on Duration {
  static const int daysPerYear = 365;
  static const int weeksPerYear = 52;
  static const int monthsPerYear = 12;
  static const int daysPerWeek = 7;

  /// Get the years of this `Duration`.
  int get years => inDays ~/ daysPerYear;

  /// Get the weeks of this `Duration`.
  int get weeks => (inDays % daysPerYear) ~/ daysPerWeek;

  /// Get the days of this `Duration`.
  int get days => (inDays % daysPerYear) % daysPerWeek;

  /// Get the hours of this `Duration`.
  int get hours => inHours % Duration.hoursPerDay;

  /// Get the minutes of this `Duration`.
  int get minutes => inMinutes % Duration.minutesPerHour;

  /// Get the seconds of this `Duration`.
  int get seconds => inSeconds % Duration.secondsPerMinute;

  /// Get the milliseconds of this `Duration`.
  int get milliseconds => inMilliseconds % Duration.millisecondsPerSecond;

  /// Get the microseconds of this `Duration`.
  int get microseconds => inMicroseconds % Duration.microsecondsPerMillisecond;

  /// Divides this Duration by [other] and
  /// returns the arithmetic division of microseconds.
  num operator /(Duration other) => inMicroseconds / other.inMicroseconds;

  Future<T> delay<T>([FutureOr<T> Function()? callback]) async {
    return Future<T>.delayed(this, callback);
  }

  /// Creates a nullable [Duration].
  ///
  /// If all parameters are null or zero, returns null.
  Duration? nullable({
    int? days,
    int? hours,
    int? minutes,
    int? seconds,
    int? milliseconds,
    int? microseconds,
  }) {
    final bool hasValue = (days != null && days != 0) ||
        (hours != null && hours != 0) ||
        (minutes != null && minutes != 0) ||
        (seconds != null && seconds != 0) ||
        (milliseconds != null && milliseconds != 0) ||
        (microseconds != null && microseconds != 0);

    if (!hasValue) {
      return null;
    }

    return Duration(
      days: days ?? 0,
      hours: hours ?? 0,
      minutes: minutes ?? 0,
      seconds: seconds ?? 0,
      milliseconds: milliseconds ?? 0,
      microseconds: microseconds ?? 0,
    );
  }

  /// Creates a copy of this `Duration` but with the given fields
  /// replaced with the new values.
  Duration copyWith({
    int? days,
    int? hours,
    int? minutes,
    int? seconds,
    int? milliseconds,
    int? microseconds,
  }) {
    return Duration(
      days: days ?? this.days,
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
      milliseconds: milliseconds ?? this.milliseconds,
      microseconds: microseconds ?? this.microseconds,
    );
  }
}
