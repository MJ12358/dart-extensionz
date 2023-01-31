import 'dart:async';
import 'dart:math' as math;

extension NumberExtension on num {
  bool toBool() {
    return this == 1;
  }

  num toRadians() => this * (math.pi / 180.0);

  num toDegrees() => this * (180.0 / math.pi);

  Future<dynamic> delay([FutureOr Function()? callback]) async {
    Future.delayed(
      Duration(milliseconds: (this * 1000).round()),
      callback,
    );
  }

  Duration get milliseconds {
    return Duration(microseconds: (this * 1000).round());
  }

  Duration get seconds {
    return Duration(milliseconds: (this * 1000).round());
  }

  Duration get minutes {
    return Duration(seconds: (this * Duration.secondsPerMinute).round());
  }

  Duration get hours {
    return Duration(minutes: (this * Duration.minutesPerHour).round());
  }

  Duration get days {
    return Duration(hours: (this * Duration.hoursPerDay).round());
  }

  String deleteTrailingZero() {
    final bool hasTrailingZero = truncateToDouble() == this;
    if (hasTrailingZero) {
      return toStringAsFixed(0);
    }
    return toString();
  }
}
