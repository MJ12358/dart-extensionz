part of dart_extensionz;

/// String Extension.
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
  String get first => isBlank ? '' : substring(0, 1);

  /// Get the last character of this [String].
  String get last => isBlank ? '' : substring(length - 1, length);

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

  /// Camel case this [String].
  String toCamelCase() {
    final List<String> split = trim().toLowerCase().split(' ');
    for (int i = 1; i < split.length; i++) {
      split[i] = split[i].substring(0, 1).toUpperCase() + split[i].substring(1);
    }
    return split.join();
  }

  /// Convert camelCase to Camel Case
  String fromCamelCase() {
    return replaceAllMapped(
      RegExp('^([a-z])|[A-Z]'),
      (Match m) => m[1] == null ? ' ${m[0]}' : m[1]!.toUpperCase(),
    ).trim();
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
