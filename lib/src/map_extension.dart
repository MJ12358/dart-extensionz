part of dart_extensionz;

extension MapExtension<K, V> on Map<K, V> {
  /// Remove null values from a map
  ///
  /// The values can themselves be maps or lists
  Map<K, V> removeNull() {
    return this
      ..removeWhere((K key, V value) => value == null)
      ..map(
        (K key, V value) => MapEntry<K, Object?>(
          key,
          value is List
              ? value.removeNull()
              : (value is Map ? value.removeNull() : value),
        ),
      );
  }
}
