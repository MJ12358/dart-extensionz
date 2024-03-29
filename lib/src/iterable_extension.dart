part of dart_extensionz;

/// [Iterable] Extension.
extension IterableExtension<T> on Iterable<T> {
  /// Split one large list into limited sub lists.
  /// ```dart
  /// [1, 2, 3, 4, 5, 6, 7, 8, 9].chunks(2)
  /// // => [[1, 2], [3, 4], [5, 6], [7, 8], [9]]
  /// ```
  Iterable<List<T>> chunks(int chunkSize) sync* {
    final int len = length;

    for (int i = 0; i < len; i += chunkSize) {
      final int start = i > len ? i - len : i;
      yield skip(start).take(chunkSize).toList();
    }
  }

  /// Same as [contains] but ignores case.
  bool containsIgnoreCase(Object? element) {
    if (element is String) {
      return map((T e) => e.toString().toLowerCase())
          .contains(element.toLowerCase());
    }
    return contains(element);
  }
}

/// [Iterable] [Comparable] Extension.
extension IterableComparableExtension<T extends Comparable<T>> on Iterable<T> {
  T get max {
    return reduce((T a, T b) => a.compareTo(b) >= 0 ? a : b);
  }

  T get min {
    return reduce((T a, T b) => a.compareTo(b) >= 0 ? b : a);
  }
}

/// [Iterable<num?>] Extension.
extension IterableNullableNumberExtension on Iterable<num?> {
  /// Sum a list of numbers but will return null
  /// if iterable is empty after type checking.
  num? get sum {
    final Iterable<num> iterable = whereType<num>();
    if (iterable.isEmpty) {
      return null;
    }
    num result = 0;
    for (final num value in iterable) {
      result += value;
    }
    return result;
  }

  /// Average a list of numbers but will return null
  /// if iterable is empty after type checking.
  num? get average {
    final Iterable<num> iterable = whereType<num>();
    if (iterable.isEmpty) {
      return null;
    }
    num result = 0.0;
    int count = 0;
    for (final num value in iterable) {
      count++;
      result += (value - result) / count;
    }
    return result;
  }
}
