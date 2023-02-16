part of dart_extensionz;

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

  /// Format a Duration
  ///
  /// https://stackoverflow.com/questions/54852585/how-to-convert-a-duration-like-string-to-a-real-duration-in-flutter
  ///
  /// https://stackoverflow.com/questions/60016267/in-dart-split-string-into-two-parts-using-length-of-first-string
  String format({
    String partSeparator = ' ',
    String valueSeparator = ' ',
  }) {
    final List<String> result = <String>[];

    final List<String> parts = toString().split(':');
    final List<String> sParts = parts[parts.length - 1].split('.');

    if (parts.length > 2) {
      final int hours = int.parse(parts[parts.length - 3]);

      if (hours != 0) {
        result.add('$hours${valueSeparator}h');
      }
    }

    if (parts.length > 1) {
      final int minutes = int.parse(parts[parts.length - 2]);

      if (minutes != 0) {
        result.add('$minutes${valueSeparator}m');
      }
    }

    if (sParts.length > 1) {
      final int seconds = int.parse(sParts[sParts.length - 2]);

      if (seconds != 0) {
        result.add('$seconds${valueSeparator}s');
      }
    }

    if (sParts.isNotEmpty) {
      final String mParts = sParts[sParts.length - 1];

      final int milliseconds =
          int.parse(mParts.substring(0, mParts.length ~/ 2));
      final int microseconds =
          int.parse(mParts.substring(mParts.length ~/ 2, mParts.length));

      if (milliseconds != 0) {
        result.add('$milliseconds${valueSeparator}ms');
      }

      if (microseconds != 0) {
        result.add('$microseconds$valueSeparatorµs');
      }
    }

    return result.join(partSeparator);
  }

  /// Convert a Duration to an ISO string
  ///
  /// https://github.com/mzdm/iso_duration_parser/blob/master/lib/src/parser.dart
  String toISO() {
    if (this == Duration.zero) {
      return 'PT0S';
    }

    final String strNegative = isNegative ? '-' : '';
    final StringBuffer strBuffer = StringBuffer('${strNegative}P');

    if (years != 0) {
      strBuffer.write('${years.abs().stripTrailingZeros()}Y');
    }
    if (weeks != 0) {
      strBuffer.write('${weeks.abs().stripTrailingZeros()}W');
    }
    if (days != 0) {
      strBuffer.write('${days.abs().stripTrailingZeros()}D');
    }

    if (<num>[hours, minutes, seconds].any((num e) => e != 0)) {
      strBuffer.write('T');

      if (hours != 0) {
        strBuffer.write('${hours.abs().stripTrailingZeros()}H');
      }
      if (minutes != 0) {
        strBuffer.write('${minutes.abs().stripTrailingZeros()}M');
      }
      if (seconds != 0) {
        strBuffer.write('${seconds.abs().stripTrailingZeros()}S');
      }
    }

    return strBuffer.toString();
  }

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
