part of dart_extensionz;

/// [Intl] Extension.
extension IntlExtension on Object? {
  static String currencySymbol({
    String? locale,
  }) {
    final NumberFormat format = NumberFormat.simpleCurrency(locale: locale);
    return format.currencySymbol;
  }
}

/// [Intl] [DateTime] Extension.
extension IntlDateTimeExtension on DateTime? {
  /// Get localized date.
  ///
  /// This uses `Intl.DateFormat`.
  ///
  /// Creates a new DateFormat, using the format specified by [pattern].
  String format({
    String pattern = 'yMd',
    String? locale,
  }) {
    if (this == null) {
      return '';
    }

    final DateFormat dateFormat = DateFormat(
      pattern,
      locale,
    );

    return dateFormat.format(this!);
  }
}

/// [Intl] [Duration] Extension.
extension IntlDurationExtension on Duration? {
  /// Get localized duration.
  ///
  /// This uses `Intl.DateFormat`.
  String format({
    String? locale,
    String pattern = 'HH:mm:ss:SS',
    bool isUtc = true,
  }) {
    if (this == null) {
      return '';
    }

    final bool isNegative = this!.isNegative;
    final Duration duration = isNegative ? this!.abs() : this!;

    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      duration.inMilliseconds,
      isUtc: isUtc,
    );

    final DateFormat dateFormat = DateFormat(
      pattern,
      locale,
    );

    final String formatted = dateFormat.format(dateTime);
    return isNegative ? '-$formatted' : formatted;
  }

  /// Humanize a Duration.
  ///
  /// https://stackoverflow.com/questions/54852585/how-to-convert-a-duration-like-string-to-a-real-duration-in-flutter
  ///
  /// https://stackoverflow.com/questions/60016267/in-dart-split-string-into-two-parts-using-length-of-first-string
  String humanize({
    String partSeparator = ' ',
    String valueSeparator = ' ',
  }) {
    if (this == null) {
      return '';
    }

    const String h = 'h';
    const String m = 'm';
    const String s = 's';
    const String ms = 'ms';
    const String us = 'µs';

    final List<String> result = <String>[];

    final List<String> parts = toString().split(':');
    final List<String> sParts = parts[parts.length - 1].split('.');

    if (parts.length > 2) {
      final int hours = int.parse(parts[parts.length - 3]);

      if (hours != 0) {
        result.add('$hours$valueSeparator$h');
      }
    }

    if (parts.length > 1) {
      final int minutes = int.parse(parts[parts.length - 2]);

      if (minutes != 0) {
        result.add('$minutes$valueSeparator$m');
      }
    }

    if (sParts.length > 1) {
      final int seconds = int.parse(sParts[sParts.length - 2]);

      if (seconds != 0) {
        result.add('$seconds$valueSeparator$s');
      }
    }

    if (sParts.isNotEmpty) {
      final String mParts = sParts[sParts.length - 1];

      final int milliseconds =
          int.parse(mParts.substring(0, mParts.length ~/ 2));
      final int microseconds =
          int.parse(mParts.substring(mParts.length ~/ 2, mParts.length));

      if (milliseconds != 0) {
        result.add('$milliseconds$valueSeparator$ms');
      }

      if (microseconds != 0) {
        result.add('$microseconds$valueSeparator$us');
      }
    }

    return result.join(partSeparator);
  }

  /// Convert a Duration to an ISO string.
  ///
  /// https://github.com/mzdm/iso_duration_parser/blob/master/lib/src/parser.dart
  String toISO() {
    if (this == null || this == Duration.zero) {
      return 'PT0S';
    }

    final String strNegative = this!.isNegative ? '-' : '';
    final StringBuffer strBuffer = StringBuffer('${strNegative}P');

    if (this!.years != 0) {
      strBuffer.write('${this!.years.abs().stripTrailingZeros()}Y');
    }
    if (this!.weeks != 0) {
      strBuffer.write('${this!.weeks.abs().stripTrailingZeros()}W');
    }
    if (this!.days != 0) {
      strBuffer.write('${this!.days.abs().stripTrailingZeros()}D');
    }

    if (<num>[this!.hours, this!.minutes, this!.seconds]
        .any((num e) => e != 0)) {
      strBuffer.write('T');

      if (this!.hours != 0) {
        strBuffer.write('${this!.hours.abs().stripTrailingZeros()}H');
      }
      if (this!.minutes != 0) {
        strBuffer.write('${this!.minutes.abs().stripTrailingZeros()}M');
      }
      if (this!.seconds != 0) {
        strBuffer.write('${this!.seconds.abs().stripTrailingZeros()}S');
      }
    }

    return strBuffer.toString();
  }
}

/// [Intl] [num] Extension.
extension IntlNumberExtension on num? {
  /// Get localized currency.
  ///
  /// This uses `Intl.NumberFormat.compactSimpleCurrency`.
  ///
  /// A number format for compact currency representations,
  /// e.g. "$1.2M" instead of "$1,200,000",
  /// and which will automatically determine a
  /// currency symbol based on the currency name or the locale.
  String toCompactCurrency({
    String? locale,
    String? name,
    int? decimalDigits,
  }) {
    if (this == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.compactSimpleCurrency(
      locale: locale,
      name: name,
      decimalDigits: decimalDigits,
    );

    return numberFormat.format(this);
  }

  /// Get localized currency.
  ///
  /// This uses `Intl.NumberFormat.simpleCurrency`.
  ///
  /// Creates a [NumberFormat] for currencies,
  /// using the simple symbol for the currency
  /// if one is available (e.g. $, €),
  /// so it should only be used if the
  /// short currency symbol will be unambiguous.
  String toSimpleCurrency({
    String? locale,
    String? name,
    int? decimalDigits,
  }) {
    if (this == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.simpleCurrency(
      locale: locale,
      name: name,
      decimalDigits: decimalDigits,
    );

    return numberFormat.format(this);
  }

  /// Get localized compact number.
  ///
  /// This uses `Intl.NumberFormat.compact`.
  ///
  /// A number format for compact representations,
  /// e.g. "1.2M" instead of "1,200,000".
  String toCompact({
    String? locale,
    bool explicitSign = false,
  }) {
    if (this == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.compact(
      locale: locale,
      explicitSign: explicitSign,
    );

    return numberFormat.format(this);
  }

  /// Get localized number.
  ///
  /// This uses `Intl.NumberFormat.decimalPatternDigits`.
  ///
  /// Create a number format that prints as DECIMAL_PATTERN.
  String toDecimalPattern({
    String? locale,
    int? decimalDigits,
  }) {
    if (this == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.decimalPatternDigits(
      locale: locale,
      decimalDigits: decimalDigits,
    );

    return numberFormat.format(this);
  }

  /// Get localized percent.
  ///
  /// This uses `Intl.NumberFormat.decimalPercentPattern`.
  ///
  /// Create a number format that prints as PERCENT_PATTERN.
  String toPercentPattern({
    String? locale,
    int? decimalDigits,
  }) {
    if (this == null) {
      return '';
    }

    final NumberFormat numberFormat = NumberFormat.decimalPercentPattern(
      locale: locale,
      decimalDigits: decimalDigits,
    );

    return numberFormat.format(this);
  }

  /// Get localized scientific pattern.
  ///
  /// This uses `Intl.NumberFormat.scientificPattern`.
  ///
  /// Create a number format that prints as SCIENTIFIC_PATTERN.
  String toScientificPattern({
    String? locale,
  }) {
    if (this == null) {
      return '';
    }

    final NumberFormat format = NumberFormat.scientificPattern(
      locale,
    );

    return format.format(this);
  }
}

/// [Intl] [String] Extension.
extension IntlStringExtension on String? {
  /// Attempt to parse `this` to a [DateTime]
  /// using the anticipated [pattern].
  ///
  /// The default [pattern] matches the
  /// format produced when stringifying a [DateTime].
  DateTime? toDateTime({
    String? pattern,
    String? locale,
    bool isUtc = false,
  }) {
    if (this == null || this!.isEmpty) {
      return null;
    }

    String? _pattern = pattern;

    if (_pattern == null) {
      const String clock12Regex = r'^\d{1,2}:\d{1,2}\s\w{2}$';
      const String clock24Regex = r'^\d{1,2}:\d{1,2}$';

      if (this!.hasMatch(clock12Regex)) {
        _pattern = 'hh:mm a';
      } else if (this!.hasMatch(clock24Regex)) {
        _pattern = 'hh:mm';
      } else {
        _pattern = "YYYY-MM-DD'T'HH:mm:ss.SSSSSSS";
      }
    }

    try {
      return DateFormat(
        _pattern,
        locale,
      ).parseLoose(this!, isUtc);
    } on FormatException catch (_) {
      return DateTime.tryParse(this!);
    }
  }

  /// Attempt to parse `this` to a [Duration]
  /// using the anticipated [pattern].
  ///
  /// The default [pattern] matches the
  /// format produced when stringifying a [Duration].
  Duration? toDuration({
    String? pattern,
    String? locale,
  }) {
    if (this == null || this!.isEmpty) {
      return null;
    }

    String? _pattern = pattern;

    if (_pattern == null) {
      const String isoRegex =
          r'^P((\d+Y)?(\d+M)?(\d+W)?(\d+D)?)(T(\d+H)?(\d+M)?(.+S)?)?$';
      const String dartRegex = r'^(\d+:)?(\d+:)?(\d+.)?(\d+)?$';
      try {
        if (this!.hasMatch(isoRegex)) {
          return _parseISODuration();
        } else if (this!.hasMatch(dartRegex)) {
          return _parseDartDuration();
        }
      } catch (_) {
        _pattern = 'HH:mm:ss.SSSSSS';
      }
    }

    final DateTime? dateTime = toDateTime(
      pattern: _pattern,
      locale: locale,
      isUtc: true,
    );

    if (dateTime == null) {
      return null;
    }

    return Duration(
      hours: dateTime.hour,
      minutes: dateTime.minute,
      seconds: dateTime.second,
      milliseconds: dateTime.millisecond,
      microseconds: dateTime.microsecond,
    );
  }

  /// Convert an ISO duration string to a Dart [Duration].
  ///
  /// https://dart-review.googlesource.com/c/sdk/+/118566/1/sdk/lib/core/duration.dart#116
  Duration _parseISODuration() {
    final List<String> split = this!.split('T');
    final String date = split.isNotEmpty ? split[0] : '';
    final String time = split.length == 2 ? split[1] : '';

    final int years = _parseTime(date, 'Y');
    final int weeks = _parseTime(date, 'W');
    final int days = _parseTime(date, 'D');
    final int hours = _parseTime(time, 'H');
    final int minutes = _parseTime(time, 'M');
    final int seconds = _parseTime(time, 'S');

    return Duration(
      days: days +
          (weeks * DurationExtension.daysPerWeek) +
          (years * DurationExtension.daysPerYear),
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  int _parseTime(String input, String timeUnit) {
    final RegExpMatch? timeMatch = RegExp('(\\d+)$timeUnit').firstMatch(input);
    if (timeMatch == null) {
      return 0;
    }
    return int.parse(timeMatch.group(1) ?? '0');
  }

  /// Convert a Dart duration string to a Dart [Duration].
  ///
  /// https://github.com/desktop-dart/duration/blob/master/lib/src/parse/parse.dart
  Duration _parseDartDuration() {
    final List<String> parts = this!.split(':');

    if (parts.length != 3) {
      throw const FormatException();
    }

    int days;
    int hours;
    int minutes;
    int seconds;
    int milliseconds;
    int microseconds;

    {
      final List<String> p = parts[2].split('.');

      if (p.length != 2) {
        throw const FormatException();
      }

      // If fractional seconds is passed, but less than 6 digits
      // Pad out to the right so we can calculate the ms/us correctly
      final int p2 = int.parse(p[1].padRight(6, '0'));
      microseconds = p2 % 1000;
      milliseconds = p2 ~/ 1000;

      seconds = int.parse(p[0]);
    }

    minutes = int.parse(parts[1]);

    {
      final int p = int.parse(parts[0]);
      hours = p % 24;
      days = p ~/ 24;
    }

    return Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    );
  }
}
