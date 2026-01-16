part of dart_extensionz;

/// [String] Extension.
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

  /// Whether this [String] is null.
  ///
  /// Possible true values are:
  ///   "null", "nil", "nill", "nullptr"
  bool get isNull {
    return <String>['null', 'nil', 'nill', 'nullptr']
        .contains(trim().toLowerCase());
  }

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

  /// Whether this [String] is ASCII.
  /// Code units/char codes less than or equal to 127.
  bool get isAscii {
    return split('')
        .map((String e) => e.codeUnitAt(0))
        .every((int f) => f <= 127);
  }

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

  /// Convert a string to an enum from [values].
  T? toEnum<T extends Enum>(List<Enum> values) {
    final Map<String, Enum> nameMap = values.asNameMap();
    return nameMap[this] as T?;
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

  /// Remove all non-alphabetic characters from this [String].
  String toAlpha() {
    const String regex = r'[^A-Za-zÀ-ÖØ-öø-ÿĀ-žƀ-ɏḀ-ỿ\s]+';
    return replaceAll(RegExp(regex), '');
  }

  /// Remove all non-numeric characters from this [String].
  String toNumeric() {
    return replaceAll(RegExp(r'\D'), '');
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
    if (isEmpty) {
      return other.length;
    }
    if (other.isEmpty) {
      return length;
    }

    final String s1 = this;
    final String s2 = other;
    final int m = s1.length;
    final int n = s2.length;

    // Create a DP table
    final List<List<int>> dp =
        List<List<int>>.generate(m + 1, (int i) => List<int>.filled(n + 1, 0));

    // Initialize first row and column
    for (int i = 0; i <= m; i++) {
      dp[i][0] = i;
    }
    for (int j = 0; j <= n; j++) {
      dp[0][j] = j;
    }

    // Fill the DP table
    for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (s1[i - 1] == s2[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1];
        } else {
          dp[i][j] = 1 +
              <int>[
                dp[i - 1][j], // deletion
                dp[i][j - 1], // insertion
                dp[i - 1][j - 1], // substitution
              ].reduce((int a, int b) => a < b ? a : b);
        }
      }
    }

    return dp[m][n];
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
    final List<String> filteredWords = words
        .where((String e) => e.replaceAll(regex, '').isNotEmpty)
        .toList(growable: false);
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

/// Convert [String] words to [num] Numbers.
extension WordToNumber on String {
  static final Map<String, int> _wordByNumber = <String, int>{
    'o': 0,
    'oh': 0,
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
    'ten': 10,
    'eleven': 11,
    'twelve': 12,
    'thirteen': 13,
    'fourteen': 14,
    'fifteen': 15,
    'sixteen': 16,
    'seventeen': 17,
    'eighteen': 18,
    'nineteen': 19,
    'twenty': 20,
    'thirty': 30,
    'forty': 40,
    'fifty': 50,
    'sixty': 60,
    'seventy': 70,
    'eighty': 80,
    'ninety': 90,
  };

  static final Map<String, int> _multipliers = <String, int>{
    'hundred': 100,
    'thousand': 1000,
    'million': 1000000,
    'billion': 1000000000,
    'trillion': 1000000000000,
  };

  static final List<String> _decimals = <String>[
    'point',
    'dot',
    'decimal',
  ];

  /// Converts English number words to a numeric value.
  num? wordToNumber() {
    final List<String> words = _normalizeInput();
    if (words.isEmpty) {
      return null;
    }

    // Check for decimal point.
    final int decimalIndex = words
        .indexWhere((String word) => _decimals.contains(word) || word == '.');

    if (decimalIndex != -1) {
      final int? intPart =
          decimalIndex > 0 ? _parseInteger(words.sublist(0, decimalIndex)) : 0;
      final double? deciPart = _parseDecimal(words.sublist(decimalIndex + 1));
      return intPart != null && deciPart != null ? intPart + deciPart : null;
    } else {
      return _parseInteger(words);
    }
  }

  List<String> _normalizeInput() {
    return toLowerCase()
        .replaceAll(RegExp(r'[^a-z\s\-\.]'), '')
        .split(RegExp(r'\s+|-'))
        .where((String word) => word.isNotEmpty)
        .toList(growable: false);
  }

  /// Parses integer numbers (without decimal points)
  int? _parseInteger(List<String> words) {
    int total = 0;
    int current = 0;
    bool isValid = false;

    for (final String word in words) {
      if (_wordByNumber.containsKey(word)) {
        current += _wordByNumber[word]!;
        isValid = true;
      } else if (_multipliers.containsKey(word)) {
        final int multiplier = _multipliers[word]!;

        if (multiplier == 100) {
          // Handle hundred specially - it multiplies the current value
          if (current == 0) {
            current = 1;
          }
          current *= multiplier;
          isValid = true;
        } else {
          // For larger multipliers, add current * multiplier to total
          total += current * multiplier;
          current = 0;
          isValid = true;
        }
      }
    }

    return isValid ? total + current : null;
  }

  /// Parses decimal numbers
  double? _parseDecimal(List<String> words) {
    if (words.isEmpty) {
      return 0.0;
    }

    String decimalString = '';

    for (final String word in words) {
      if (!_wordByNumber.containsKey(word)) {
        return null;
      }

      final int number = _wordByNumber[word]!;
      // ignore: use_string_buffers
      decimalString += number.toString();
    }

    try {
      return double.parse('0.$decimalString');
    } catch (_) {
      return null;
    }
  }
}
