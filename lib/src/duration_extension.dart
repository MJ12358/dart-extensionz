part of dart_extensionz;

/// [Duration] Extension.
extension DurationExtension on Duration {
  static const int daysPerYear = 365;
  static const int weeksPerYear = 52;
  static const int monthsPerYear = 12;
  static const int daysPerWeek = 7;

  int get years => inDays ~/ daysPerYear;
  int get weeks => (inDays % daysPerYear) ~/ daysPerWeek;
  int get days => (inDays % daysPerYear) % daysPerWeek;
  int get hours => inHours % Duration.hoursPerDay;
  int get minutes => inMinutes % Duration.minutesPerHour;
  int get seconds => inSeconds % Duration.secondsPerMinute;
  int get milliseconds => inMilliseconds % Duration.millisecondsPerSecond;
  int get microseconds => inMicroseconds % Duration.microsecondsPerMillisecond;

  num operator /(Duration other) => inMicroseconds / other.inMicroseconds;

  Future<dynamic> delay([FutureOr<dynamic> Function()? callback]) async {
    return Future<dynamic>.delayed(this, callback);
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
