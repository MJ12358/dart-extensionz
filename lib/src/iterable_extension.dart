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
extension IterableComparableExtension<T extends Comparable<T>> on Iterable<T> {
  /// Returns the largest element in the list.
  T get max {
    return reduce((T a, T b) => a.compareTo(b) >= 0 ? a : b);
  }

  /// Returns the smallest element in the list.
  T get min {
    return reduce((T a, T b) => a.compareTo(b) >= 0 ? b : a);
  }
}

/// [Iterable<Comparable?>] Extension.
extension IterableNullableComparableExtension<T extends Comparable<T>>
    on Iterable<T?> {
  /// Returns the largest element in the list or null
  /// if the list is empty after type checking.
  T? get max {
    final Iterable<T> iterable = whereType<T>();
    if (iterable.isEmpty) {
      return null;
    }
    return iterable.max;
  }

  /// Returns the smallest element in the list or null
  /// if the list is empty after type checking.
  T? get min {
    final Iterable<T> iterable = whereType<T>();
    if (iterable.isEmpty) {
      return null;
    }
    return iterable.min;
  }
}

/// [Iterable<num>] Extension.
extension IterableNumberExtension<T extends num> on Iterable<T> {
  /// Sum a list of numbers.
  num get sum {
    num result = 0;
    for (final num value in this) {
      result += value;
    }
    return result;
  }

  /// Average a list of numbers.
  num get average {
    num result = 0.0;
    int count = 0;
    for (final num value in this) {
      count++;
      result += (value - result) / count;
    }
    return result;
  }

  /// Returns the largest number in the list.
  T get max {
    return reduce((T a, T b) => a >= b ? a : b);
  }

  /// Returns the smallest number in the list.
  T get min {
    return reduce((T a, T b) => a >= b ? b : a);
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
    return iterable.sum;
  }

  /// Average a list of numbers but will return null
  /// if iterable is empty after type checking.
  num? get average {
    final Iterable<num> iterable = whereType<num>();
    if (iterable.isEmpty) {
      return null;
    }
    return iterable.average;
  }

  /// Returns the largest number in the list or null
  /// if the list is empty after type checking.
  num? get max {
    final Iterable<num> iterable = whereType<num>();
    if (iterable.isEmpty) {
      return null;
    }
    return iterable.max;
  }

  /// Returns the smallest number in the list or null
  /// if the list is empty after type checking.
  num? get min {
    final Iterable<num> iterable = whereType<num>();
    if (iterable.isEmpty) {
      return null;
    }
    return iterable.min;
  }
}
