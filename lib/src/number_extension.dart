part of dart_extensionz;

/// Cardinal directions.
enum Cardinal {
  north(initials: 'N'),
  northNorthEast(initials: 'NNE'),
  northEast(initials: 'NE'),
  eastNorthEast(initials: 'ENE'),
  east(initials: 'E'),
  eastSouthEast(initials: 'ESE'),
  southEast(initials: 'SE'),
  southSouthEast(initials: 'SSE'),
  south(initials: 'S'),
  southSouthWest(initials: 'SSW'),
  southWest(initials: 'SW'),
  westSouthWest(initials: 'WSW'),
  west(initials: 'W'),
  westNorthWest(initials: 'WNW'),
  northWest(initials: 'NW'),
  northNorthWest(initials: 'NNW');

  const Cardinal({
    required this.initials,
  });

  final String initials;
}

/// [num] Extension.
extension NumberExtension on num {
  /// Returns the length of this [num].
  int get length => '$this'.length;

  bool toBool() {
    return this == 1;
  }

  Future<dynamic> delay([FutureOr<dynamic> Function()? callback]) async {
    return toSeconds().delay(callback);
  }

  Duration toMilliseconds() {
    return Duration(microseconds: (this * 1000).round());
  }

  Duration toSeconds() {
    return Duration(milliseconds: (this * 1000).round());
  }

  Duration toMinutes() {
    return Duration(seconds: (this * Duration.secondsPerMinute).round());
  }

  Duration toHours() {
    return Duration(minutes: (this * Duration.minutesPerHour).round());
  }

  Duration toDays() {
    return Duration(hours: (this * Duration.hoursPerDay).round());
  }

  num stripTrailingZeros() {
    final bool hasTrailingZero = truncateToDouble() == this;
    if (hasTrailingZero) {
      return num.parse(toStringAsFixed(0));
    }
    return this;
  }

  /// Transforms this [num] into a [String] and pads it
  /// on the left if it's shorter than the given [width].
  String padLeft(int width, [String padding = '0']) {
    return toString().padLeft(width, padding);
  }

  /// Transforms this [num] into a [String] and pads it
  /// on the right if it's shorter than the given [width].
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

  /// Works similar to `num.toStringAsFixed(fractionDigits)`.
  ///
  /// But without the need to convert back yourself.
  num toPrecision([int fractionDigits = 0]) {
    final double mod = math.pow(10, fractionDigits.toDouble()).toDouble();
    return (this * mod).round().toDouble() / mod;
  }

  /// Receive a string with this number suffixed.
  ///
  /// Example: 1, 10, 1K, 1M, 1G
  String humanize({
    int decimals = 0,
    String delimeter = '',
  }) {
    final List<String> suffixes = <String>[
      '', // no suffix
      'K', // kilo
      'M', // mega
      'G', // giga
      'T', // tera
      'P', // peta
      'E', // exa
      'Z', // zeta
      'Y', // yotta
      'R', // ronna
      'Q', // quetta
    ];

    if (isNaN) {
      return '';
    }

    if (this < 1000) {
      return toString();
    }

    final int exp = (math.log(this) / math.log(1000)).floor();
    final String size = (this / math.pow(1000, exp)).toStringAsFixed(decimals);
    return '$size$delimeter${suffixes[exp]}';
  }

  /// Receive a string with this number suffixed.
  ///
  /// Example: 1 B, 10 B, 1 KB, 1 MB, 1 GB
  String computerize({
    int decimals = 0,
    String delimeter = ' ',
  }) {
    const List<String> suffixes = <String>[
      'B', // byte
      'KB', // kilobyte
      'MB', // megabyte
      'GB', // gigabyte
      'TB', // terabyte
      'PB', // petabyte
      'EB', // exabyte
      'ZB', // zettabyte
      'YB', // yottabyte
    ];

    if (isNaN) {
      return '';
    }

    if (this <= 0) {
      return '0${delimeter}B';
    }

    final int i = (math.log(this) / math.log(1024)).floor();
    final String size = (this / math.pow(1024, i)).toStringAsFixed(decimals);
    return '$size$delimeter${suffixes[i]}';
  }

  Cardinal toCardinal() {
    const List<Cardinal> array = Cardinal.values;
    final num value = ((this / 22.5) + 0.5).floor();
    final num mod = value % 16;
    return array[mod.toInt()];
  }
}

/// Nullable [num] Extension.
extension NullableNumberExtension on num? {
  /// Returns the length of this [num].
  int get length => this != null ? this!.length : 0;

  bool toBool() {
    return this != null && this!.toBool();
  }
}
