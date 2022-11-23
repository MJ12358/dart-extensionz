import 'dart:async';

import 'package:dart_extensions/dart_extensions.dart';

extension DurationExtension on Duration {
  Future<dynamic> delay([FutureOr Function()? callback]) async {
    return Future.delayed(this, callback);
  }

  String format() {
    return toString().split('.').first.padLeft(8, '0');
  }

  int get daysPerYear => 365;
  int get weeksPerYear => 52;
  int get monthsPerYear => 12;
  int get daysPerWeek => 7;

  // TODO: finish this
  // int get years => (inDays * daysPerYear) % daysPerYear;
  // int get months =>
  //     (((inDays * daysPerYear) / monthsPerYear) % monthsPerYear).round();
  // int get weeks => (inDays * daysPerWeek * weeksPerYear) % weeksPerYear;
  int get days => inDays % daysPerWeek;
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

    // if (years != 0) {
    //   strBuffer.write('${years.abs().deleteTrailingZero()}Y');
    // }
    // if (months != 0) {
    //   strBuffer.write('${months.abs().deleteTrailingZero()}M');
    // }
    // if (weeks != 0) {
    //   strBuffer.write('${weeks.abs().deleteTrailingZero()}W');
    // }
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
