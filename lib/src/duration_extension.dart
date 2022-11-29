import 'dart:async';

import 'package:dart_extensions/dart_extensions.dart';

extension DurationExtension on Duration {
  Future<dynamic> delay([FutureOr Function()? callback]) async {
    return Future.delayed(this, callback);
  }

  String format() {
    // this does not include milliseconds
    return toString().split('.').first.padLeft(8, '0');
  }

  static Duration parse(String value) {
    int hours = 0;
    int minutes = 0;
    int microseconds;
    List<String> parts = value.split(':');

    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }

    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }

    microseconds = (double.parse(parts[parts.length - 1]) * 1000000).round();

    return Duration(
      hours: hours,
      minutes: minutes,
      microseconds: microseconds,
    );
  }

  static Duration tryParse(String? value) {
    if (value == null || value.isBlank) {
      return Duration.zero;
    }
    return parse(value);
  }

  static const int daysPerYear = 365;
  static const int weeksPerYear = 52;
  static const int monthsPerYear = 12;
  static const int daysPerWeek = 7;

  // int get inYears => inDays ~/ daysPerYear;
  // int get inWeeks => inDays ~/ daysPerWeek;

  int get years => inDays ~/ daysPerYear;
  // int get months => ((inDays * daysPerYear) ~/ monthsPerYear) % monthsPerYear;
  int get weeks => (inDays % daysPerYear) ~/ daysPerWeek;
  int get days => (inDays % daysPerYear) % daysPerWeek;
  int get hours => inHours % Duration.hoursPerDay;
  int get minutes => inMinutes % Duration.minutesPerHour;
  int get seconds => inSeconds % Duration.secondsPerMinute;
  int get milliseconds => inMilliseconds % Duration.millisecondsPerSecond;
  int get microseconds => inMicroseconds % Duration.microsecondsPerMillisecond;

  /// https://github.com/mzdm/iso_duration_parser/blob/master/lib/src/parser.dart
  String toISO() {
    if (this == Duration.zero) {
      return 'PT0S';
    }

    final strNegative = isNegative ? '-' : '';
    final strBuffer = StringBuffer('${strNegative}P');

    if (years != 0) {
      strBuffer.write('${years.abs().deleteTrailingZero()}Y');
    }
    // if (months != 0) {
    //   strBuffer.write('${months.abs().deleteTrailingZero()}M');
    // }
    if (weeks != 0) {
      strBuffer.write('${weeks.abs().deleteTrailingZero()}W');
    }
    if (days != 0) {
      strBuffer.write('${days.abs().deleteTrailingZero()}D');
    }

    if (<num>[hours, minutes, seconds].any((e) => e != 0)) {
      strBuffer.write('T');

      if (hours != 0) {
        strBuffer.write('${hours.abs().deleteTrailingZero()}H');
      }
      if (minutes != 0) {
        strBuffer.write('${minutes.abs().deleteTrailingZero()}M');
      }
      if (seconds != 0) {
        strBuffer.write('${seconds.abs().deleteTrailingZero()}S');
      }
    }

    return strBuffer.toString();
  }
}
