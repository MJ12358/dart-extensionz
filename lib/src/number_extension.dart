part of dart_extensionz;

extension NumberExtension on num {
  bool toBool() {
    return this == 1;
  }

  Future<dynamic> delay([FutureOr<dynamic> Function()? callback]) async {
    Future<dynamic>.delayed(
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

  num stripTrailingZeros() {
    final bool hasTrailingZero = truncateToDouble() == this;
    if (hasTrailingZero) {
      return num.parse(toStringAsFixed(0));
    }
    return this;
  }

  /// Transforms `this` into a `String` and pads it on the left if it's shorter
  /// than the given [width].
  String padLeft(int width, [String padding = '0']) {
    return toString().padLeft(width, padding);
  }

  /// Transforms `this` into a `String` and pads it on the right if it's shorter
  /// than the given [width].
  String padRight(int width, [String padding = '0']) {
    return toString().padRight(width, padding);
  }

  /// Returns `true` if `this` is between the given range
  /// of [min] (inclusive) and [max] (exclusive).
  bool isBetween(num min, num max) {
    assert(
      min <= max,
      'Invalid bounds: $min and $max, min cannot be greater than max',
    );
    return min <= this && this < max;
  }

  /// Returns `true` if this number is outside the given range
  /// of [min] (exclusive) and [max] (exclusive).
  bool isOutside(num min, num max) {
    assert(
      min <= max,
      'Invalid bounds: $min and $max, min cannot be greater than max',
    );
    return this < min || this > max;
  }

  /// Works similar to `num.toStringAsFixed(fractionDigits)`
  ///
  /// But without the need to convert back yourself
  num toPrecision([int fractionDigits = 0]) {
    final double mod = math.pow(10, fractionDigits.toDouble()).toDouble();
    return (this * mod).round().toDouble() / mod;
  }
}
