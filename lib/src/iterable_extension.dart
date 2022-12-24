extension IterableComparableExtension<T extends Comparable<T>> on Iterable<T> {
  T get max {
    return reduce((a, b) => a.compareTo(b) >= 0 ? a : b);
  }

  T get min {
    return reduce((a, b) => a.compareTo(b) >= 0 ? b : a);
  }
}

extension IterableNullableNumberExtension on Iterable<num?> {
  num? get nullableSum {
    Iterable<num> iterable = whereType<num>();
    if (iterable.isEmpty) {
      return null;
    }
    num result = 0;
    for (var value in iterable) {
      result += value;
    }
    return result;
  }

  num? get nullableAverage {
    Iterable<num> iterable = whereType<num>();
    if (iterable.isEmpty) {
      return null;
    }
    num result = 0.0;
    int count = 0;
    for (var value in iterable) {
      count++;
      result += (value - result) / count;
    }
    return result;
  }
}
