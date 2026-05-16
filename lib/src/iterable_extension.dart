part of dart_extensionz;

/// [Iterable] Extension.
extension IterableExtension<T> on Iterable<T> {
  /// Split one large list into limited sub lists.
  /// ```dart
  /// [1, 2, 3, 4, 5, 6, 7, 8, 9].chunks(2)
  /// // => [[1, 2], [3, 4], [5, 6], [7, 8], [9]]
  /// ```
  Iterable<List<T>> chunks(int chunkSize) sync* {
    if (chunkSize <= 0) {
      return;
    }
    final int len = length;

    for (int i = 0; i < len; i += chunkSize) {
      final int start = i > len ? i - len : i;
      yield skip(start).take(chunkSize).toList(growable: false);
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
extension IterableComparableExtension<T extends Comparable<T>> on Iterable<T?> {
  /// Returns the largest element in the list.
  T? get max {
    final Iterable<T> iterable = whereType<T>();
    if (iterable.isEmpty) {
      return null;
    }
    return iterable.reduce((T a, T b) => a.compareTo(b) >= 0 ? a : b);
  }

  /// Returns the smallest element in the list.
  T? get min {
    final Iterable<T> iterable = whereType<T>();
    if (iterable.isEmpty) {
      return null;
    }
    return iterable.reduce((T a, T b) => a.compareTo(b) >= 0 ? b : a);
  }
}

/// [Iterable<num>] Extension.
extension IterableNumberExtension<T extends num> on Iterable<T?> {
  /// Sum a list of numbers.
  num get sum {
    num result = 0;
    final Iterable<T> iterable = whereType<T>();
    if (iterable.isEmpty) {
      return result;
    }
    for (final num value in iterable) {
      result += value;
    }
    return result;
  }

  /// Average a list of numbers.
  num get average {
    num result = 0.0;
    int count = 0;
    final Iterable<T> iterable = whereType<T>();
    if (iterable.isEmpty) {
      return result;
    }
    for (final num value in iterable) {
      count++;
      result += (value - result) / count;
    }
    return result;
  }

  /// Returns the largest number in the list.
  T? get max {
    final Iterable<T> iterable = whereType<T>();
    if (iterable.isEmpty) {
      return null;
    }
    return iterable.reduce((T a, T b) => a >= b ? a : b);
  }

  /// Returns the smallest number in the list.
  T? get min {
    final Iterable<T> iterable = whereType<T>();
    if (iterable.isEmpty) {
      return null;
    }
    return iterable.reduce((T a, T b) => a >= b ? b : a);
  }
}
