part of '../dart_extensionz.dart';

/// [Map] Extension.
extension MapExtension<K, V> on Map<K, V>? {
  /// Safely retrieves a value of type [T] from
  /// the map using the provided [key].
  /// Returns `null` if the key does not exist
  /// or if the value is not of type [T].
  T? get<T extends Object>(String key) {
    if (this == null) {
      return null;
    }
    final Object? value = this![key];
    return value is T ? value : null;
  }

  /// Remove null values from a map.
  ///
  /// The values can themselves be maps or lists.
  Map<K, V> removeNull() {
    if (this == null) {
      return <K, V>{};
    }

    final Map<K, V> result = <K, V>{};

    for (final MapEntry<K, V>(:K key, :V value) in this!.entries) {
      if (value == null) {
        continue;
      }

      final V cleanedValue = switch (value) {
        final List<V> list => list.removeNull() as V,
        final Map<K, V> map => map.removeNull() as V,
        _ => value as V,
      };

      result[key] = cleanedValue;
    }

    return result;
  }
}
