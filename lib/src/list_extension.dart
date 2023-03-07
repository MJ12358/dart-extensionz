part of dart_extensionz;

extension ListExtension<T> on List<T> {
  /// A clone of this List<T>.
  List<T> get clone => List<T>.from(this);

  /// Clone this list, then add [other] to it.
  List<T> cloneAdd(List<T> other) {
    final List<T> result = clone;
    result.addAll(other);
    return result;
  }

  /// Returns the last index integer.
  int get lastIndex => length - 1;

  /// Returns a random element from this list
  T get random => this[math.Random().nextInt(length)];

  /// Split one large list into limited sub lists.
  /// ```dart
  /// [1, 2, 3, 4, 5, 6, 7, 8, 9].chunks(2)
  /// // => [[1, 2], [3, 4], [5, 6], [7, 8], [9]]
  /// ```
  List<List<T>> chunks(int chunkSize) {
    final List<List<T>> chunks = <List<T>>[];
    final int len = length;
    for (int i = 0; i < len; i += chunkSize) {
      final int size = i + chunkSize;
      chunks.add(sublist(i, size > len ? len : size));
    }
    return chunks;
  }

  /// Remove null values from a list.
  ///
  /// The values can themselves be maps or lists.
  List<T> removeNull() {
    return this
      ..removeWhere((T value) => value == null)
      ..map(
        (T value) => value is List
            ? value.removeNull()
            : (value is Map ? value.removeNull() : value),
      ).toList();
  }
}
