part of dart_extensionz;

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
      locale ?? Platform.localeName,
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

    final DateFormat dateFormat = DateFormat(
      pattern,
      locale ?? Platform.localeName,
    );

    final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
      this!.inMilliseconds,
      isUtc: isUtc,
    );

    return dateFormat.format(dateTime);
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
      locale: locale ?? Platform.localeName,
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
      locale: locale ?? Platform.localeName,
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
      locale: locale ?? Platform.localeName,
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
      locale: locale ?? Platform.localeName,
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
      locale: locale ?? Platform.localeName,
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

    final NumberFormat numberFormat = NumberFormat.scientificPattern(
      locale ?? Platform.localeName,
    );

    return numberFormat.format(this);
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
    String? pattern = "YYYY-MM-DD'T'HH:mm:ss.SSSSSSS",
    String? locale,
    bool isUtc = false,
  }) {
    if (this == null || this!.isEmpty) {
      return null;
    }

    // back compat these patterns
    // TODO: remove these at some point in the future
    // this should be handled by the caller...
    const String clock12Regex = r'^\d{1,2}:\d{1,2}\s\w{2}$';
    const String clock24Regex = r'^\d{1,2}:\d{1,2}$';

    if (this!.hasMatch(clock12Regex)) {
      // ignore: parameter_assignments
      pattern = 'hh:mm a';
    } else if (this!.hasMatch(clock24Regex)) {
      // ignore: parameter_assignments
      pattern = 'hh:mm';
    }

    try {
      return DateFormat(
        pattern,
        locale ?? Platform.localeName,
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
    String pattern = 'HH:mm:ss.SSSSSS',
    String? locale,
  }) {
    if (this == null || this!.isEmpty) {
      return null;
    }

    /// ISO durations are not handled well with [Intl].
    const String isoRegex =
        r'^P((\d+Y)?(\d+M)?(\d+W)?(\d+D)?)(T(\d+H)?(\d+M)?(\d+S)?)?$';

    if (this!.hasMatch(isoRegex)) {
      return _parseISODuration();
    }

    final DateTime? dateTime = toDateTime(
      pattern: pattern,
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
    final int years = _parseTime('Y');
    // final int months = _parseTime('M');
    final int weeks = _parseTime('W');
    final int days = _parseTime('D');
    final int hours = _parseTime('H');
    final int minutes = _parseTime('M');
    final int seconds = _parseTime('S');

    return Duration(
      days: days + (weeks * 7) + (years * 365),
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }

  int _parseTime(String timeUnit) {
    final RegExpMatch? timeMatch = RegExp('(\\d+)$timeUnit').firstMatch(this!);
    if (timeMatch == null) {
      return 0;
    }
    return int.parse(timeMatch.group(1) ?? '0');
  }
}
