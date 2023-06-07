part of dart_extensionz;

extension StringExtension on String {
  /// Whether this [String] is empty or consists solely
  /// of whitespace characters.
  bool get isBlank => trim().isEmpty;

  bool get isNotBlank => !isBlank;

  bool get isInt => int.tryParse(this) != null;

  bool get isNotInt => !isInt;

  bool get isDouble => double.tryParse(this) != null;

  bool get isNotDouble => !isDouble;

  bool get isNum => num.tryParse(this) != null;

  bool get isNotNum => !isNum;

  bool get isDateTime => DateTime.tryParse(this) != null;

  bool get isNotDateTime => !isDateTime;

  bool get isNumeric => hasMatch(r'^\d+$');

  bool get isNotNumeric => !isNumeric;

  bool get isAlpha => hasMatch(r'^[a-zA-Z]+$');

  bool get isNotAlpha => !isAlpha;

  bool get isAlphanumeric => isNumeric || isAlpha;

  bool get isNotAlphanumeric => !isAlphanumeric;

  int get lineLength => '\n'.allMatches(this).length + 1;

  String ifEmpty(String value) => isEmpty ? value : this;

  String ifBlank(String value) => isBlank ? value : this;

  String get first {
    if (isBlank) {
      return '';
    }
    return substring(0, 1);
  }

  String get last {
    if (isBlank) {
      return '';
    }
    return substring(length - 1, length);
  }

  /// Get the bool equivalent of this [String].
  ///
  /// Possible true values are:
  ///   "y", "yes", "on", "ok", "true", "t", "1", "online"
  bool toBool() {
    return <String>['y', 'yes', 'on', 'ok', 'true', 't', '1', 'online']
        .contains(trim().toLowerCase());
  }

  /// Equivalent to `DateTime.tryParse(this)`.
  DateTime? toDateTime() {
    return DateTime.tryParse(this);
  }

  /// Equivalent to `int.tryParse(this)`.
  int? toInt() {
    return int.tryParse(this) ?? toDouble()?.round();
  }

  /// Equivalent to `num.tryParse(this)`.
  num? toNum() {
    return num.tryParse(this);
  }

  /// Equivalent to `double.tryParse(this)`.
  double? toDouble() {
    return double.tryParse(this);
  }

  bool hasMatch(String pattern) {
    return RegExp(pattern).hasMatch(this);
  }

  String normalizeSpace() {
    return replaceAll(RegExp(' +'), ' ').trim();
  }

  /// Get this initials of this [String].
  ///
  /// When the string is empty returns "NA".
  String get initials {
    if (isBlank) {
      return 'NA';
    }

    final String s = replaceAll(RegExp(r'[^\w\s]+'), '');
    final List<String> split = s.trim().split(RegExp(' +'));

    if (split.length >= 2) {
      return '${split[0].substring(0, 1)} ${split[1].substring(0, 1)}';
    }

    if (split[0].length >= 2) {
      return '${split[0].substring(0, 1)} ${split[0].substring(1, 2)}';
    }

    return split[0].substring(0, 1);
  }

  /// Capitalize the first letter.
  String get capitalize {
    if (isBlank) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Title case this [String].
  ///
  /// The first letter of each word is capitalized.
  String toTitleCase() {
    if (isBlank) {
      return this;
    }
    final List<String> split = trim().split(RegExp(' +'));
    return split.map((String str) => str.capitalize).join(' ');
  }

  /// Split this [String] by a [length].
  List<String> splitByLength(int length) {
    return <String>[substring(0, length), substring(length)];
  }

  /// Convert this string to a [Duration].
  ///
  /// Can be used with an ISO formatted string
  ///   or a [Duration] object that has been stringified.
  Duration toDuration() {
    const String isoRegex =
        r'^P((\d+Y)?(\d+M)?(\d+W)?(\d+D)?)(T(\d+H)?(\d+M)?(\d+S)?)?$';

    const String dartRegex = r'^(\d+:)?(\d+:)?(\d+.)?(\d+)?$';

    if (hasMatch(isoRegex)) {
      return _parseISODuration();
    } else if (hasMatch(dartRegex)) {
      return _parseDartDuration();
    } else {
      return Duration.zero;
    }
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
    final RegExpMatch? timeMatch = RegExp('(\\d+)$timeUnit').firstMatch(this);
    if (timeMatch == null) {
      return 0;
    }
    return int.parse(timeMatch.group(1) ?? '0');
  }

  /// Convert a Dart duration string to a Dart [Duration].
  ///
  /// https://github.com/desktop-dart/duration/blob/master/lib/src/parse/parse.dart
  Duration _parseDartDuration() {
    final List<String> parts = split(':');

    if (parts.length != 3) {
      throw const FormatException('Invalid duration format');
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
        throw const FormatException('Invalid time format');
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

    // TODO verify that there are no negative parts

    return Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    );
  }

  /// Get the Levenshtein distance between two strings.
  ///
  /// The Levenshtein distance between two strings is defined as
  /// the minimum number of edits needed to transform one string into the other.
  int levenshtein(String other) {
    // if either string is empty,
    // difference is inserting all chars from the other
    if (isEmpty) {
      return other.length;
    }
    if (other.isEmpty) {
      return length;
    }

    // if first letters are the same, the difference is whatever is
    // required to edit the rest of the strings
    if (this[0] == other[0]) {
      return substring(1).levenshtein(other.substring(1));
    }

    // else try:
    //      changing first letter of [this] to that of [other],
    //      remove first letter of [this], or
    //      remove first letter of [other]
    int a = substring(1).levenshtein(other.substring(1));
    final int b = levenshtein(other.substring(1));
    final int c = substring(1).levenshtein(other);

    if (a > b) {
      a = b;
    }
    if (a > c) {
      a = c;
    }

    // any of which is 1 edit plus editing the rest of the strings
    return a + 1;
  }

  /// Repeat a string a number of [times] with a [separator].
  String repeat(int times, [String separator = '']) {
    if (times <= 0) {
      return this;
    }

    String result = '';

    for (int i = 1; i <= times; i++) {
      if (i == times) {
        result += this;
      } else {
        result += '$this$separator';
      }
    }

    return result;
  }

  /// Truncate a string to a [limit] with an [ending].
  String truncate(int limit, [String ending = '...']) {
    if (length <= limit) {
      return this;
    }

    final int end = limit - ending.length;

    return substring(0, end) + ending;
  }
}
