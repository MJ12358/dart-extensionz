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
