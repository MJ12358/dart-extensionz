part of dart_extensionz;

extension StringExtension on String {
  /// Whether this [String] is empty or consists solely
  /// of whitespace characters.
  bool get isBlank => trim().isEmpty;

  /// Whether this [String] is not empty and does not consist solely
  /// of whitespace characters.
  bool get isNotBlank => !isBlank;

  /// Whether this [String] can be parsed as an [int].
  bool get isInt => int.tryParse(this) != null;

  /// Whether this [String] can not be parsed as an [int].
  bool get isNotInt => !isInt;

  /// Whether this [String] can be parsed as a [double].
  bool get isDouble => double.tryParse(this) != null;

  /// Whether this [String] can not be parsed as a [double].
  bool get isNotDouble => !isDouble;

  /// Whether this [String] can be parsed as a [num].
  bool get isNum => num.tryParse(this) != null;

  /// Whether this [String] can not be parsed as a [num].
  bool get isNotNum => !isNum;

  /// Whether this [String] can be parsed as a [DateTime].
  bool get isDateTime => DateTime.tryParse(this) != null;

  /// Whether this [String] can not be parsed as a [DateTime].
  bool get isNotDateTime => !isDateTime;

  /// Whether this [String] is only digits.
  bool get isNumeric => hasMatch(r'^\d+$');

  /// Whether this [String] is not digits.
  bool get isNotNumeric => !isNumeric;

  /// Whether this [String] is only alphabetic.
  bool get isAlpha => hasMatch(r'^[a-zA-Z]+$');

  /// Whether this [String] is not alphabetic.
  bool get isNotAlpha => !isAlpha;

  /// Whether this [String] is either digits or alphabetic.
  bool get isAlphanumeric => isNumeric || isAlpha;

  /// Whether this [String] is not digits or alphabetic.
  bool get isNotAlphanumeric => !isAlphanumeric;

  /// Get the line length of this [String].
  int get lineLength => '\n'.allMatches(this).length + 1;

  /// Returns [value] when this [String] [isEmpty].
  String ifEmpty(String value) => isEmpty ? value : this;

  /// Returns [value] when this [String] [isBlank].
  String ifBlank(String value) => isBlank ? value : this;

  /// Get the first character of this [String].
  String get first {
    if (isBlank) {
      return '';
    }
    return substring(0, 1);
  }

  /// Get the last character of this [String].
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

  /// A convienence method wrapping `RegExp([pattern]).hasMatch`.
  bool hasMatch(String pattern) {
    return RegExp(pattern).hasMatch(this);
  }

  /// Convert all spaces (one or more) to a single space.
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

  /// Converts this string to a [DateTime].
  ///
  /// Can be used with hh:mm tt formatted strings
  /// or anything `DateTime.parse` accepts.
  DateTime? toDateTime() {
    const String clockRegex = r'^\d{1,2}:\d{1,2}\s\w{2}$';
    if (hasMatch(clockRegex)) {
      return _parseClockTime();
    }
    return DateTime.tryParse(this);
  }

  /// Convert hh:mm tt to DateTime
  DateTime? _parseClockTime() {
    final List<String> parts = split(' ');
    if (parts.length != 2) {
      return null;
    }
    final List<String> timeParts = parts[0].split(':');
    final String meridiem = parts[1];
    if (timeParts.length != 2) {
      return null;
    }
    final bool isAm = meridiem == 'AM';
    final int hour = int.parse(timeParts[0]);
    final int minute = int.parse(timeParts[1]);
    return DateTime(0, 0, 0, isAm ? hour : hour + 12, minute);
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

  /// Gets the read time of a string.
  int readTime({
    int wordsPerMinute = 200,
  }) {
    if (isBlank) {
      return 0;
    }

    final List<String> words = trim().split(RegExp(r'(\s+)'));
    final double magicNumber = words.length / wordsPerMinute;
    return (magicNumber * 100).toInt();
  }

  /// Counts the number of words in a string.
  int wordCount({
    RegExp? filter,
  }) {
    if (isBlank) {
      return 0;
    }

    final List<String> words = trim().split(RegExp(r'(\s+)'));
    final RegExp regex = filter ?? RegExp('([^a-zA-Z]+)');
    final List<String> filteredWords =
        words.where((String e) => e.replaceAll(regex, '').isNotEmpty).toList();
    return filteredWords.length;
  }

  /// Counts the word occurrences in a string.
  Map<String, int> wordOccurrences({
    RegExp? filter,
  }) {
    final Map<String, int> result = <String, int>{};

    if (isBlank) {
      return result;
    }

    final List<String> words = trim().split(RegExp(r'(\s+)'));
    final RegExp regex = filter ?? RegExp('([^a-zA-Z]+)');

    for (int i = 0; i < words.length; i++) {
      final String word = words[i].replaceAll(regex, '');
      int? j = result[word];

      if (j != null) {
        j++;
        result[word] = j;
      } else {
        result[word] = 1;
      }
    }

    return result;
  }

  /// Masks a string.
  String mask({
    int start = 0,
    int end = 4,
    String char = '#',
  }) {
    if (isBlank) {
      return this;
    }

    if (start > end) {
      throw const FormatException('Start must not be greater than end.');
    }

    final int maskLength = end - start;
    return substring(0, start) + char.repeat(maskLength) + substring(end);
  }
}
