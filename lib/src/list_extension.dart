import 'package:dart_extensionz/src/map_extension.dart';

extension ListExtension<T> on List<T> {
  /// Split one large list into limited sub lists
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

  /// Remove null values from a list
  ///
  /// The values can themselves be maps or lists
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
