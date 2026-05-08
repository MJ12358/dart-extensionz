part of dart_extensionz;

/// [Map] Extension.
extension MapExtension<K, V> on Map<K, V> {
  /// Safely retrieves a value of type [T] from
  /// the map using the provided [key].
  /// Returns `null` if the key does not exist
  /// or if the value is not of type [T].
  T? get<T extends Object>(String key) {
    final Object? value = this[key];
    return value is T ? value : null;
  }

  /// Remove null values from a map.
  ///
  /// The values can themselves be maps or lists.
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

/// Nullable [Map] Extension.
extension NullableMapExtension<K, V> on Map<K, V>? {
  T? get<T extends Object>(String key) {
    return this?.get<T>(key);
  }

  Map<K, V> removeNull() => this != null ? this!.removeNull() : <K, V>{};
}
